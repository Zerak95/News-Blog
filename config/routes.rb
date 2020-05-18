Rails.application.routes.draw do
  get 'sessions/new'
  # get 'users/new'
  # root 'application#hello'
  # post '/signup',  to: 'users#create'

  root   'sessions#home'
  get    '/signup' => 'users#new'
  post   '/signup' => 'users#create'
  get    '/login'  => 'sessions#new'
  post   '/login'  => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  resources :users
end