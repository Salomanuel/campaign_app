Rails.application.routes.draw do

  root 'static_pages#home'




  get     '/login',   to: 'sessions#new'
  post    '/login',   to: 'sessions#create'
  delete  '/logout',  to: 'sessions#destroy'
  
  get     '/signup',  to: 'users#new'
  post    '/signup',  to: 'users#create'

  resources :users
  resources :campaigns
  resources :discussions, only: [:index, :create, :show]
  resources :comments
  resources :tags
end
