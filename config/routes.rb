Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :technicians
  resources :producers
  resources :events
  resources :users
  post '/login', to: 'users#login'
  get '/profile', to: 'users#profile'
  get 'technicians/:id/events', to:  'technicians#events'
  get 'producers/:id/events', to:  'producers#events'
end
