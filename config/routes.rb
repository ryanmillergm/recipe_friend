Rails.application.routes.draw do
  get 'dashboard/index'
  root 'home#index'

  resources :users, only: [:create, :new, :update, :edit, :show] do
    member do
      get :confirm_email
    end
  end

  resources :sessions, only: [:new, :create, :destroy]
  resources :recipes, only: [:index, :new, :create, :destroy, :edit, :show]
end
