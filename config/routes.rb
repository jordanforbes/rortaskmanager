Rails.application.routes.draw do
  # sets up route to users index page
  root "users#index"

  # creates routes for users index action
  resources :users do
    resources :tasks, only: [:index, :new, :create]
  end

  # creates routes for tasks index action
  resources :tasks, only: [:show, :edit, :update, :destroy]
end
