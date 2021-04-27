Rails.application.routes.draw do
  root "games#index"    #ルートURLをindexに設定
  
  devise_for :users
  
  resources :games do
    resources :comments, only: [:create]
  end
  
  resources :users
  
end
