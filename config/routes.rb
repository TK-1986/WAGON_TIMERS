Rails.application.routes.draw do
  devise_for :users
  root to: "cars#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :cars do
    resources :bookings, except: %i[destroy show]
  end
  resources :bookings, only: %i[destroy show]

  get "dashboard", to: "dashboard#dashboard"

  # Defines the root path route ("/")
  # root "articles#index"
end
