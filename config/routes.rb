Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "devise/registrations"
  }
  
  resources :games, only: [:index, :show] do
    collection do
      get :pl, :cl, :liga, :euro, :seriea, :ligue, :bundes
    end
  end
  
  resources :rates
  
  resources :players
  
  resources :users do
    member do
     get :following, :followers
    end
  end
  resources :relationships, only: [:create, :destroy]
  
  get 'chat/:id' => 'chats#show', as: 'chat'
  resources :chats, only: [:create]

  root "games#index"
end
