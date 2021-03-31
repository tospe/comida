Rails.application.routes.draw do
  root "meal_plans#index"

  get "/meal_plans/all", to: "meal_plans#all"
  resources :recipes
  resources :ingredients
  resources :meal_plans
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end