Rails.application.routes.draw do
  root "portal#index"
  mount ResqueWeb::Engine => "/resque_web"
end
