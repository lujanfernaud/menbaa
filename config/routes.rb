Rails.application.routes.draw do
  root "posts#index"

  get    "login",  to: "sessions#new"
  post   "login",  to: "sessions#create"
  delete "logout", to: "sessions#destroy"

  get    "signup", to: "users#new"
  post   "signup", to: "users#create"

  resources :users, except: [:new, :create]
  resources :posts
end
