Rails.application.routes.draw do
  # sets up route to users index page
  root "users#index"

  # creates routes for users index action
  resources :users, only: [:index]

  # creates routes for tasks index action
  resources :tasks, only: [:index]
end
