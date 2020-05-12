Rails.application.routes.draw do
  # get 'users/new'
  # root 'application#hello'
  # post '/signup',  to: 'users#create'

  root 'users#new'
  get  '/signup' => 'users#new'
  post '/signup' => 'users#create'
  resources :users
end