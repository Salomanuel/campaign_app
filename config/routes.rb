Rails.application.routes.draw do
  get 'sessions/new'

  get 'static_pages/home'


  get '/login',   to: 'sessions#new'
  get '/login',   to: 'sessions#create'
  get '/logout',  to: 'sessions#destroy'


  resources :users
end
