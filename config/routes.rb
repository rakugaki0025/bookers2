Rails.application.routes.draw do # config_bookers2
  
  devise_for :users
    # ユーザーズ
   
  root to: "homes#top"
    # ホーム
  
  get 'homes/about' => "homes#about", as: 'about'
    # 取得 'アドレス' => "指定のコントローラー#アクション", as: "名前つきルート"
    
    
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
end
