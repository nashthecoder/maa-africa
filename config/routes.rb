Rails.application.routes.draw do
  # Define your routes here

  # Example resource route
  resources :user_details, only: [:new, :create, :index]

  # You can define your root route here, for example:
  root 'user_details#new'
end
