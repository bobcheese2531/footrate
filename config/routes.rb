Rails.application.routes.draw do
  root "games#index"    #ルートURLをindexに設定
  
  devise_for :users
  
  resources :games do
    resources :comments, only: [:create]  #コメント機能
    resources :likes, only: [:create, :destroy]   #いいね機能
  end
  
  resources :users
  
end
