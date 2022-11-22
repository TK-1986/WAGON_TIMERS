Rails.application.routes.draw do
  devise_for :users
  root to: "cars#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # get "cars/search", to: "cars#search"
  # post "cars/search", to: "cars#search"
  resources :cars do
    resources :bookings, only: %i[new create]
  end
  resources :bookings, only: %i[index]
end
