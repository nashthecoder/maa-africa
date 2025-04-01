Rails.application.routes.draw do
  get 'symptoms/index'
  get 'symptoms/new'
  get 'symptoms/create'
  get 'symptoms/checker'
  devise_for :users
  # Define your routes here

  # Example resource route
  resources :user_details, only: [:new, :create, :index, :destroy]
  get 'about', to: 'pages#about'
  get 'resources', to: 'pages#resources'
  get 'stories', to: 'pages#stories'
  get 'community', to: 'pages#community'
  # You can define your root route here, for example:
  root 'user_details#new'
end
