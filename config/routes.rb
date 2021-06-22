Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "devise/registrations"
  }
  
  resources :games, only: %i(index show) do
    collection do
      get :league, :tournament, :scorers
    end
  end
  
  resources :rates, only: %i(index show destroy)
  
  resources :players, only: %i(new create)
  
  resources :users, only: %i(show edit update)
  
  root "games#index"
end
