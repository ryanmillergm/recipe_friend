Rails.application.routes.draw do
  root 'home#index'

  resources :users, only: [:create, :new, :update, :edit, :show]
  resources :sessions, only: [:new, :create, :destroy]
  resources :recipes, only: [:index]

  resources :users do
    member do
      get :confirm_email
    end
  end
end
