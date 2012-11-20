ResqueWeb::Application.routes.draw do
  resource  :overview, :controller => 'overview'

  resources :working
  resources :queues
  resources :failures

  root :to => 'overview#show'
end
