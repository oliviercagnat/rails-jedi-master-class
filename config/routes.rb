Rails.application.routes.draw do
  devise_for :users

  resources :users do
    resources :bookings, only: :index
  end
  root to: 'pages#home'
  get 'pages/user_profile' => 'pages#user_profile'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :lessons do
    resources :bookings, only: [:new, :create, :edit, :show]
  end
  resources :bookings, only: [:destroy, :update]
end
