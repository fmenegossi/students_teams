Rails.application.routes.draw do

  root to: 'pages#home'

  devise_for :users

  resources :users, only:[:index]

  namespace :api do
      resources :users , only:[:update]
  end

end
