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
  get 'events/:id/available_technicians', to:  'events#available_technicians'
  patch 'events/:id/addtechnician', to: 'events#add_technician_to_event'
  patch '/events/:id/removetechnician', to: 'events#remove_technician_from_event'
end
