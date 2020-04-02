Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :vehicles
  resources :makes
  resources :carnames
  resources :photos
  resources :customers
  resources :employees
  resources :appointments
  
end
