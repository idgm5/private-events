Rails.application.routes.draw do
  put '/assist/' => 'events#assist'

  resources :events
  resources :users

  root 'events#index'
end
