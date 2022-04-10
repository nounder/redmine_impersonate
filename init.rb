
Redmine::Plugin.register :redmine_impersonate do
  name "Redmine Impersonate"
  author "Ralph Gutkowski"
  description "Login as any user with click of a button."
  version '1.0.0'
  url 'https://github.com/rgtk/redmine_impersonate'
  author_url 'https://github.com/rgtk'

  requires_redmine version_or_higher: '3.0.0'
end

RedmineImpersonate.install
