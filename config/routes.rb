Rails.application.routes.draw do
  resources :coupons
  resources :users, only: [:create]
  post '/login', to: 'auth#create'
  get '/profile', to: 'users#profile'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post '/facebook', to: 'users#find_or_create_with_facebook'
end
