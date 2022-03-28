Rails.application.routes.draw do
  namespace :admin do
      resources :users
      resources :admin_users
      resources :posts

      root to: "users#index"
    end
  resources :posts
  devise_for :users, skip: :registration
  get 'static/homepage'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'static#homepage'
end
