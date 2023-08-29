Rails.application.routes.draw do # config_bookers2
  
  devise_for :users
    # ユーザーズ
   
  root to: "homes#top"
    # ホーム
  
  get 'home/about' => "homes#about", as: 'about'
    # 取得 '実際の表示アドレス' => "指定のコントローラー#アクション", as: "名前つきルート"
  
  resources :books, only: [:index, :show, :create, :destroy]
    # booksディレクトリ ルーティング自動生成 onlyで(限定生成)
    
    
  resources :users, only: [:show, :index, :create, :edit, :update]
    # users ルーティング自動生成 onlyで(限定生成)
   
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
   
end
