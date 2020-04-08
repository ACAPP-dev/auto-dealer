Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  root to: 'application#home'
  get '/about-andrews-exotics', to: 'static#about'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :vehicles
  resources :makes
  resources :carnames
  resources :photos
  
  resources :customers do
    resources :appointments
  end

  resources :employees
  resources :appointments
  resources :sessions
  
end
