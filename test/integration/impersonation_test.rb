require File.expand_path('../../test_helper', __FILE__)

class ImpersonationTest < ActionDispatch::IntegrationTest
  include Redmine::I18n

  fixtures :users

  test "impersonate link as anonymous in user profile" do
    user = User.find_by_login('dlopper')

    get "/users/#{user.id}"
    assert_select '#impersonate', false
  end

  test "impersonate link as user in user profile" do
    log_user('jsmith', 'jsmith')

    user = User.find_by_login('dlopper')

    get "/users/#{user.id}"
    assert_select '#impersonate', false
  end

  test "impersonate link as admin in user profile" do
    log_user('admin', 'admin')

    user = User.find_by_login('jsmith')

    get "/users/#{user.id}"
    assert_select '#impersonate'
  end

  test "impersonate link as admin in admin profile" do
    log_user('admin', 'admin')

    user = User.find_by_login('admin')

    get "/users/#{user.id}"
    assert_select '#impersonate', false
  end

  test "impersonate link as admin in edit" do
    log_user('admin', 'admin')

    user = User.find_by_login('jsmith')

    get "/users/#{user.id}/edit"
    assert_select '#impersonate'
  end

  test "impersonating user as admin" do
    log_user('admin', 'admin')

    user = User.find_by_login('jsmith')

    post '/admin/impersonation', user_id: user.id
    follow_redirect!
    assert_equal User.current, user
    assert_select '#impersonation-bar'
  end

  test "impersonating user as user" do
    log_user('jsmith', 'jsmith')

    user = User.find_by_login('dlopper')

    post '/admin/impersonation', user_id: user.id
    assert_response 403
    assert_equal User.current.login, 'jsmith'
  end

  test "impersonating user as anonymous" do
    user = User.find_by_login('jsmith')

    post '/admin/impersonation', user_id: user.id
    follow_redirect!
    assert User.current.anonymous?
    assert_select '#impersonation-bar', false
  end

  test "stop impersonating user" do
    log_user('admin', 'admin')

    user = User.find_by_login('jsmith')

    post '/admin/impersonation', user_id: user.id

    delete '/admin/impersonation', nil,
           { 'HTTP_REFERER' => "/users/#{user.id}" }
    assert_redirected_to "/users/#{user.id}"
    assert_select '#impersonation-bar', false
  end

  def log_user(login, password)
    get "/login"
    post "/login", :username => login, :password => password
    assert_equal login, User.find(session[:user_id]).login
  end
end
