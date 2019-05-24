Rails.application.routes.draw do
  root 'articles#index'
  resources :articles

  post 'users', to: 'users#create'
  get 'signup', to: 'users#new', as: 'signup'
end
