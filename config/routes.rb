Rails.application.routes.draw do
  root 'home#index'

  resources :users, only: [:create, :new, :update, :edit, :show] do
    member do
      get :confirm_email
    end
  end

  resources :sessions, only: [:new, :create, :destroy]
  resources :recipes, only: [:index, :show]
  # resources :dashboard, only: [:index]
  resources :ingredients, only: [:create, :new, :edit, :update, :destroy]
  resources :favorites, only: [:index, :create, :destroy]

  resources :users do
    resources :recipes, only: [:create, :new, :edit, :update, :destroy]
  end

  namespace :dashboard do
    get '/', to: 'dashboard#index'
  end
end
