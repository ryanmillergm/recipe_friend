Rails.application.routes.draw do
  root 'home#index'

  resources :users, only: [:create, :new, :update, :edit, :show] do
    member do
      get :confirm_email
    end
  end

  resources :sessions, only: [:new, :create, :destroy]
  resources :recipes, only: [:index, :show]
  resources :ingredients, only: [:create, :new, :edit, :update, :destroy]
  resources :recipe_ingredients, only: [:destroy]
  resources :steps, only: [:create, :new, :edit, :update, :destroy]
  resources :favorites, only: [:index, :create, :destroy]

  resources :users do
    resources :recipes, only: [:create, :new, :edit, :update, :destroy]
  end

  namespace :dashboard do
    get '/', to: 'dashboard#index'
    resources :my_recipes, only: [:index, :show]
  end

  resources :recipes do
    resources :comments
  end

  resources :comments do
    resources :comments
  end

  # match "*path", to: "application#render_not_found", via: :all
end
