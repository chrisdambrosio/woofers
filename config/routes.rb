Rails.application.routes.draw do
  mount JasmineRails::Engine => '/specs' if defined?(JasmineRails)
  root to: 'pages#main'
  get '/dogs/search' => 'dogs#search'
end
