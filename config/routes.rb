Rails.application.routes.draw do

  root :to => 'application#index'

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  resources :users do
  	resources :posts
  end
  resources :posts
  resources :sessions
  resources :favorites

end
