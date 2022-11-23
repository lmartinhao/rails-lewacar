Rails.application.routes.draw do
  devise_for :users

  resources :rides do
    resources :matches, only: [:new]
  end
  root to: "rides#index"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
end
