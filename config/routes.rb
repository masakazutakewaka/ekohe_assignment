Rails.application.routes.draw do
  root 'articles#index'
  resources :articles

  post 'users', to: 'users#create'
  post 'sessions', to: 'sessions#create'
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
end
