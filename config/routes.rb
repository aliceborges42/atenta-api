Rails.application.routes.draw do
  resources :security_buttons
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  get '/member_details' => 'members#index'
  put '/member_update' => 'members#update'
  patch '/member_update' => 'members#update'

  put '/update_password' => 'passwords#update'
  
  post '/deslikes', to: 'deslikes#create', as: 'deslike'
  delete '/deslikes', to: 'deslikes#delete'

  post '/likes', to: 'likes#create', as: 'like'
  delete '/likes', to: 'likes#delete'
  
  post '/complaints', to: 'complaints#create', as: 'complaint'

  put '/compaints/:id', to: 'complaints#update'

  patch '/compaints/:id', to: 'complaints#update'

  get 'complaints/:complaint_id/likes', to: 'likes#likes_by_complaint', as: 'likes_by_complaint'

  get '/likes/likes_by_user', to: 'likes#likes_by_user', as: 'likes_by_user'  
  
  get 'complaints/:complaint_id/deslikes', to: 'deslikes#deslikes_by_complaint', as: 'deslikes_by_complaint'

  get '/deslikes/deslikes_by_user', to: 'deslikes#deslikes_by_user', as: 'deslikes_by_user'
  
  resources :deslikes
  resources :likes
  resources :type_specifications
  resources :complaint_types
  resources :complaints
end
