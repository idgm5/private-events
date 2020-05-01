Rails.application.routes.draw do
  put '/assist/' => 'events#assist'

  resources :events
  resources :users
  resources :attendances
  
  root 'events#index'

end
