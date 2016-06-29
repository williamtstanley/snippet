Rails.application.routes.draw do
  # get "project/new" => 'session#new', :as => :sign_in
  # get new_session_path => 'session#new', :as => :sign_in
  # get "/sessions/new" => "session#new", :as => :sign_in

  resources :conversations, only: [:new, :create] do
    resources :messages, only: [:create]
  end

  resources :snippets do
    resources :favourites, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end
  resources :favourites, only: [:index]

  root "main#index"

  resources :users, only: [:new, :create, :edit, :show, :update] do
    resources :conversations, only: [:index] do
      resources :messages, only: [:index]
    end
    resources :profiles, only: [:edit, :update]
  end
  resources :password_resets, only: [:new, :create, :edit, :update]
  #USER CONTROL
  resources :sessions, only: [:new, :create] do
      delete :destroy, on: :collection
  end

end
