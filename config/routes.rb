Rails.application.routes.draw do
  root 'flights#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :flights, only: %i[index create]
  resources :bookings
end
