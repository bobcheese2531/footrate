Rails.application.routes.draw do
  devise_for :users, controllers: {
    :registrations => 'users/registrations'
  }
  
  root "games#index"
  
  resources :games, only: %i(index show) do
    collection do
      get :league, :cl, :euro, :scorers, :team
    end
    resources :comments, only: %i(create destroy)
  end

  resources :rates do
    collection do
      get :best_XI
    end
  end
  
  resources :users, only: %i(show edit update)

end