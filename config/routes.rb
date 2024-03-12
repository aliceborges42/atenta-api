Rails.application.routes.draw do
  resources :security_buttons
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  get '/member_details' => 'members#index'
  
  post '/deslikes', to: 'deslikes#create', as: 'deslike'

  post '/likes', to: 'likes#create', as: 'like'
  
  post '/complaints', to: 'complaints#create', as: 'complaint'

  resources :deslikes
  resources :likes
  resources :type_specifications
  resources :complaint_types
  resources :complaints
end
