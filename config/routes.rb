Rails.application.routes.draw do
<<<<<<< HEAD
  get 'bookings/new'
=======
  devise_for :users
>>>>>>> 240beb54b842df7f7f7dc0a43913405699f2a405
  root to: "pages#home"

  resources :bookings

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
