Rails.application.routes.draw do
  mount JasmineRails::Engine => '/specs' if defined?(JasmineRails)

  root to: 'pages#main'

  namespace :api do
    get '/dogs', to: 'dogs#index'
  end
end
