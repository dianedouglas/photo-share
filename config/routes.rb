Rails.application.routes.draw do

  root :to => 'application#index'

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  resources :users, :only => [:new, :create, :show] do
  	resources :posts, :only => [:new, :index]
  end
  resources :posts, :only => [:index, :create]
  resources :sessions, :only => [:new, :create, :destroy]
  resources :favorites, :only => [:destroy, :create]

end
