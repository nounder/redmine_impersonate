RedmineApp::Application.routes.draw do
  post '/admin/impersonation', to: 'impersonation#create', as: 'new_impersonation'
  delete '/admin/impersonation', to: 'impersonation#destroy', as: 'impersonation'
end
