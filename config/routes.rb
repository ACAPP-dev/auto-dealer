Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  root to: 'application#home'
  get '/about-andrews-exotics', to: 'static#about'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/auth/facebook' , as: 'fb_login'
  get '/auth/facebook/callback', to: 'sessions#create_fb'

  resources :vehicles, only: [:index, :show]
  #post '/vehicles', to: 'admin/vehicles#create'
  #patch '/vehicles/:id', to: 'admin/vehicles#update'
  
  resources :appointments
  resources :sessions
  
  resources :customers do
    resources :appointments
  end

  namespace :admin do
    resources :vehicles
    resources :appointments
    resources :employees
    resources :sessions
    resources :menus, only: [:index]
    get '/login', to: 'sessions#new'
    post '/login', to: 'sessions#create'
    delete '/logout', to: 'sessions#destroy'
  end

end
