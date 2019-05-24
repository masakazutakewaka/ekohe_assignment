Rails.application.routes.draw do
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  root 'articles#index'
  resources :articles

  post 'users', to: 'users#create'
  get 'signup', to: 'users#new', as: 'signup'
end
