Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'pages/user_profile' => 'pages#user_profile'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :lessons do
    resources :bookings, only: [:new, :create, :edit]
  end
  resources :bookings, only: :destroy
end
