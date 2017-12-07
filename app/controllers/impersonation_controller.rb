class ImpersonationController < ApplicationController
  before_filter :require_login
  before_filter :require_admin, only: [:create]

  require_sudo_mode :create

  def create
    if !session[:true_user_id]
      session[:true_user_id] = User.current.id
      impersonated_user = User.find(params[:user_id])
      User.current = impersonated_user
      session[:user_id] = impersonated_user.id

      if impersonated_user.respond_to?(:generate_session_token)
        session[:tk] = impersonated_user.generate_session_token
      end
    end

    redirect_to home_url
  end

  def destroy
    true_user = User.find_by_id(session[:true_user_id])

    if true_user && true_user.active?
      self.logged_user = true_user
      session.delete(:real_user_id)
    end

    redirect_to :back
  end
end
