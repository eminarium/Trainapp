Rails.application.routes.draw do

  # Defines the root path route ("/")
  root "categories#index"

  devise_for :users
  resources :categories
  resources :exercises
  resources :workouts
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

end
