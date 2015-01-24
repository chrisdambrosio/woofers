Rails.application.routes.draw do
  root to: 'pages#main'
  get '/dogs/search' => 'dogs#search'
end
