Rails.application.routes.draw do
  devise_for :users

  resources :rides do
    resources :matches, only: %i[new create]
  end

  root to: "rides#index"

  get "reservations", to: "reservations#index"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
end
