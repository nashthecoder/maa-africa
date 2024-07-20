Rails.application.routes.draw do
  devise_for :users
  # Define your routes here

  # Example resource route
  resources :user_details, only: [:new, :create, :index, :destroy]
  get 'about', to: 'pages#about'
  # You can define your root route here, for example:
  root 'user_details#new'
end
