Rails.application.routes.draw do
  mount JasmineRails::Engine => '/specs' if defined?(JasmineRails)
  root to: 'pages#main'
  get '/dogs', to: 'dogs#index'
  resources :orgs, only: [:show]
end
