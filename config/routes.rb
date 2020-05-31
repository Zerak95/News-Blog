Rails.application.routes.draw do
  # get 'sessions/new'
  # get 'users/new'
  # root 'application#hello'
  # post '/signup',  to: 'users#create'

  root   'posts#index'
  get    '/signup' => 'users#new'
  post   '/signup' => 'users#create'
  get    '/login'  => 'sessions#new'
  post   '/login'  => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  resources :users
  resources :posts, only: [:new, :create, :index, :show]
  resources :comments, only: [:create]
end