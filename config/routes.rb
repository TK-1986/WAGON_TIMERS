Rails.application.routes.draw do
  devise_for :users
  root to: "cars#home"
  resources :cars do
    resources :bookings, only: %i[create]
  end
  resources :bookings, only: %i[index show destroy]
end
