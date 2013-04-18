# Match IDs with dots in them
id_pattern = /[^\/]+/

ResqueWeb::Application.routes.draw do
  resource  :overview, :controller => 'overview'

  resources :working
  resources :queues,   :constraints => {:id => id_pattern}
  resources :workers,  :constraints => {:id => id_pattern}

  resources :failures, :constraints => {:failure_id => id_pattern, :id => id_pattern} do
    resources :retry
    resources :jobs do
      put 'retry', :on => :member
    end
  end

  delete '/failures' => "failures#destroy"

  get '/stats' => "stats#index"
  get '/stats/:action', :controller => :stats
  get '/stats/:action/:id', :controller => :stats, :constraints => {:id => id_pattern}

  root :to => 'overview#show'
end
