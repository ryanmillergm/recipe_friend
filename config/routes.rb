Rails.application.routes.draw do
  get 'users/index'
  get 'recipes/index'
  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/recipes', to: 'recipes#index'

  get '/login', to: 'sessions#new'

  

  resources :users, only: [:create, :new, :update, :edit]

end
