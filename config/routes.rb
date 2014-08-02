# Match IDs with dots in them
id_pattern = /[^\/]+/

ResqueWeb::Engine.routes.draw do

  ResqueWeb::Plugins.plugins.each do |p|
    mount p::Engine => p.engine_path
  end

  resource  :overview,  :only => [:show], :controller => :overview
  resources :working,   :only => [:index]
  resources :queues,    :only => [:index,:show,:destroy], :constraints => {:id => id_pattern} do
    member do
      put 'clear' 
    end
  end
  resources :workers,   :only => [:index,:show], :constraints => {:id => id_pattern}
  resources :failures,  :only => [:show,:index,:destroy] do
    member do
      put 'retry'
    end
    collection do
      put 'retry_all'
      delete 'destroy_all'
    end
  end

  get '/stats' => "stats#index"
  get '/stats/:action',     :controller => :stats
  get '/stats/:action/:id', :controller => :stats, :constraints => {:id => id_pattern}, :as => :statistic

  root :to => 'overview#show'

end
