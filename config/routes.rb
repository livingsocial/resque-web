ResqueWeb::Application.routes.draw do
  resource  :overview, :controller => 'overview'
  resources :queues

  root :to => 'overview#show'
end
