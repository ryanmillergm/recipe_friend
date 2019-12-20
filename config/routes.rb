Rails.application.routes.draw do
  root 'home#index'

  resources :users, only: [:create, :new, :update, :edit, :show] do
    member do
      get :confirm_email
    end
  end

  # post '/alexa' do
  #   p request.body.read
  # end

  get 'auth/google_oauth2', to: 'auth#google_oauth'
  get 'auth/google_oauth2/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')

  match 'auth/facebook/callback', to: 'sessions#create', via: [:get, :post]

  resources :sessions, only: [:new, :create, :destroy]
  resources :recipes, only: [:index, :show]
  resources :ingredients, only: [:create, :new, :edit, :update, :destroy]
  resources :recipe_ingredients, only: [:destroy]
  resources :steps, only: [:create, :new, :edit, :update, :destroy]
  resources :favorites, only: [:index, :create, :destroy]
  resources :forbidden, only: [:show]

  resources :users do
    resources :recipes, only: [:create, :new, :edit, :update, :destroy]
    resources :crop_images, only: [:new, :create, :show, :edit]
    resources :friends, only: [:create, :update, :index, :destroy]
  end

  namespace :dashboard do
    get '/', to: 'dashboard#index'
    resources :my_recipes, only: [:index, :show]
    resources :my_profile, only: [:show, :edit]
  end

  resources :recipes do
    resources :comments, only: [:create, :new, :edit, :update, :destroy]
    resources :crop_recipe_images, only: [:new, :create]
  end

  resources :comments do
    resources :comments, only: [:create, :new, :edit, :update, :destroy]
  end

  # match "*path", to: "application#render_not_found", via: :all
end
