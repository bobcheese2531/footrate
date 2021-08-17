Rails.application.routes.draw do
  devise_for :users, controllers: {
    :registrations => 'users/registrations'
  }
  
  resources :games, only: %i(index show) do
    collection do
      get :league, :cl, :euro, :scorers
    end
    resources :comments, only: %i(create destroy)
  end
  
  resources :rates, only: %i(index show destroy)
  
  resources :players, only: %i(new create edit update)
  
  resources :users, only: %i(show edit update)
  
  root "games#index"
end
