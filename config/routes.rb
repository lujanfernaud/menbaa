Rails.application.routes.draw do
  namespace :admin do
    resources :posts
    resources :users

    root to: "posts#index"
  end

  root "posts#index"

  get    "login",  to: "sessions#new"
  post   "login",  to: "sessions#create"
  delete "logout", to: "sessions#destroy"

  get    "signup", to: "users#new"
  post   "signup", to: "users#create"

  resources :users, except: [:new, :create]
  resources :posts
end
