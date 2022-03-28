Rails.application.routes.draw do
  resources :posts
  devise_for :users, skip: :registration
  get 'static/homepage'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'static#homepage'
end
