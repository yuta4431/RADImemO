Rails.application.routes.draw do
  get 'hosts/show'
  get 'login', to: 'user_sessions#new', as: 'login'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy', as: 'logout'
  
  resources :users, only: %i[new create]
  resources :hosts
  resources :programs
  # Defines the root path route ("/")
  root "programs#index"
end
