Rails.application.routes.draw do
  get 'login', to: 'user_sessions#new', as: 'login'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy', as: 'logout'
  get 'search', to: 'search#index'
  
  resources :users, only: %i[new create show edit update]
  resources :personalities
  resources :programs
  resources :posts
  # Defines the root path route ("/")
  root "posts#index"
end
 