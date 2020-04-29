Rails.application.routes.draw do
  resources :events do
     member do
        patch :assist
        put :assist
      end
  end
  resources :users

  root 'events#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
