require 'redmine_impersonate'

Redmine::Plugin.register :redmine_impersonate do
  name "Redmine Impersonate"
  author "Ralph Gutkowski"
  description "Login as any user with click of a button."
  version '0.10.0'
  url 'https://github.com/rgtk/redmine_impersonate'
  author_url 'https://github.com/rgtk'
end

RedmineImpersonate.install
