Rails.application.routes.draw do
  resources :snippets
  root "snippets#index"
  resources :users, only: [:new, :create]
end
