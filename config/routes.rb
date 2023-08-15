Rails.application.routes.draw do # config_bookers2
  
  devise_for :users
   # ユーザーズ
   
  root to: "homes#top"
   # ホーム
  
  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
