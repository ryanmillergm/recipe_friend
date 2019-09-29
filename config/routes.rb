Rails.application.routes.draw do
  root 'home#index'

  resources :users, only: [:create, :new, :update, :edit, :show]
  resources :sessions, only: [:new, :create]
  resources :recipes, only: [:index]
end
