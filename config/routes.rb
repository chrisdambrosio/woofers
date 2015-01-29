Rails.application.routes.draw do
  mount JasmineRails::Engine => '/specs' if defined?(JasmineRails)

  root to: 'pages#main'

  get '/dogs/*any', to: 'pages#main'

  namespace :api do
    resources :dogs, only: [ :index ]
  end
end
