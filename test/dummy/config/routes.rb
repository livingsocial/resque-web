Rails.application.routes.draw do
  root :to => "portal#index"
  mount ResqueWeb::Engine => "/resque_web"
end
