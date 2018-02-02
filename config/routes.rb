Rails.application.routes.draw do

  root to: 'pages#home'

  devise_for :users

  resources :users, only: [:index]

  namespace :api do
      resources :users , only: [:update]
      resources :user_matches, only: [:create]
      resources :matches, only: [:index, :show]
      resources :groups, only: [:index, :create, :destroy]
  end

end
