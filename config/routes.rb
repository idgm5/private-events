Rails.application.routes.draw do
  #get 'users/show'
  #get 'users/create'
  #get 'users/new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # user
  resources :users, only: [:index, :show, :new, :create] do
    resources :attendances, only: [:index, :edit, :update]
  end

end
