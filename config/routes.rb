Rails.application.routes.draw do
  root "games#index"    #ルートURLをindexに設定
  
  devise_for :users
  
  resources :games do
    resources :comments, only: [:create]  #コメント機能
    resources :likes, only: [:create, :destroy]   #いいね機能
  end
  
  resources :users do
    member do
     get :following, :followers #フォロー、フォロワーの表示
    end
  end
  
  resources :chats, only: [:create, :show]  #チャット機能
  
  
  resources :relationships, only: [:create, :destroy] #フォロー機能
  
end
