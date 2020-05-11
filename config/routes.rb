Rails.application.routes.draw do
  # get 'users/new'
  # root 'application#hello'
  root 'users#new'
  get    '/signup'    => 'users#new'
  resources :users
end