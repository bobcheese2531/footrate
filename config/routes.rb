Rails.application.routes.draw do
  root "games#index"    #ルートURLを設定
  
  devise_for :users
  resources :games
  
end
