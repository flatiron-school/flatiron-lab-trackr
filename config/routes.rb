Rails.application.routes.draw do
  root "cohorts#index"
  resources :pull_request_files
  resources :pull_requests
  resources :students, param: :slug
  resources :cohorts, param: :slug do
    resources :labs, param: :slug
  end

  get '/search', to: 'searches#new', as: :search

end
