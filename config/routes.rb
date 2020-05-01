Rails.application.routes.draw do
  put '/assist/' => 'events#assist'

  resources :events
  resources :users
  resources :guests
  
  root 'events#index'
end
