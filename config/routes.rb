Rails.application.routes.draw do
  resources :schedules, only: %i[index update]
  #get 'schedules', to: "schedules#index"
  #post 'schedule/:id', to: "schedules#status"
  devise_for :users

  resources :rides do
    resources :matches, only: [:new, :create]
  end
  root to: "rides#index"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
end
