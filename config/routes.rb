ResqueWeb::Application.routes.draw do
  resource  :overview, :controller => 'overview'

  resources :working
  resources :queues
  resources :failures
  resources :workers

  get '/stats', :controller => :stats, :action => :index
  get '/stats/:action', :controller => :stats

  root :to => 'overview#show'
end
