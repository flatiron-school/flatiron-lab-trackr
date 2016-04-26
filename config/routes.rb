Rails.application.routes.draw do
  root "cohorts#index"
  resources :labs, param: :slug
  resources :pull_request_files
  resources :pull_requests
  resources :students, param: :slug
  resources :cohorts, param: :slug
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount Act`ionCable.server => '/cable'
end
