Rails.application.routes.draw do
  put '/assist/' => 'events#assist'
  
  get 'sign_in', action: :sign_in, controller: 'users'
  post 'login', action: :login, controller: 'users'
  delete 'log_out', action: :destroy, controller: 'users'
  
  resources :events
  resources :users
  resources :attendances
  
  root 'events#index'

end
