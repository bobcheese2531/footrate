Rails.application.routes.draw do
  root "games#index"    #ルート設定
  
  devise_for :users
  resources :games
  
end
