Rails.application.routes.draw do

  resources :snippets do
    resources :favourites, only: [:create, :destroy]
  end
  resources :favourites, only: [:index]

  root "main#index"
  
  resources :users, only: [:new, :create, :edit, :update]
  resources :password_resets, only: [:new, :create, :edit, :update]
  #USER CONTROL
  resources :sessions, only: [:new, :create] do
      delete :destroy, on: :collection
  end
end
