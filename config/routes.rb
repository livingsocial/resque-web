ResqueWeb::Application.routes.draw do
  resource  :overview, :controller => 'overview'

  resources :working
  resources :queues
  resources :failures
  resources :workers

  root :to => 'overview#show'
end
