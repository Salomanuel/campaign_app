Rails.application.routes.draw do
  get 'sessions/new'

  get 'static_pages/home'
  resources :users
end
