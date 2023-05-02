Rails.application.routes.draw do
  resources :categories
  resources :exercises
  resources :workouts
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "categories#index"
end
