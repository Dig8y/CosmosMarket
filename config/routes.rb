Rails.application.routes.draw do
  root to: "pages#home"
  devise_for :users

  resources :lands, except: [:new] do
    resources :lands, only: :index
    resources :bookings, only: [:new, :create]
    resources :reviews, only: [:new, :create]
  end
  resources :bookings, only: [:destroy, :edit, :update]

  get 'lands/:id/conquer', to: 'lands#conquer', as: 'conquer_land'
  patch "lands/:id/conquer", to: 'lands#conquer_update'
  get "dashboard", to: "users#dashboard"
end
