Rails.application.routes.draw do
  root "snippets#index"
  resources :users, only: [:new, :create]
end
