class UsersController < ApplicationController
        # bookers2_app_controller_users
   
   
   def show
       
       @book = Book.new
              # インスタンス変数 = モデル名 空オブジェクト 新規作成
              # 左の箱に右を格納
              # インスタンス名はなんでもいい,空のオブジェクトもなんでもいい
         
       @user = User.find(params[:id])
              # インスタンス変数 = ユーザー_find 探す:単数でどれか一つ
              
       @books = Book.all
       
       #@post_images = @user.post_images.page(params[:page])
              # メソッド 1:N の関係性 [1] (アソシエーション)
              # .ページ送り機能
       
   end
   
   
   def index
       
       @books_lists = Book.all
         # ログイン中の全ユーザーデータ取得?
         
   
   end
   
   
   def edit
       
       @book_image = Book.new
       
      
   end
   
   
   def update
       
        
   end
   
   
   
end
