class UsersController < ApplicationController
        # bookers2_app_controller_users
   
   
   def show
       
       @user = User.find(params[:id])
              # インスタンス変数 = ユーザー_find 探す:単数でどれか一つ
              
       @books = Book.all
       
       #@post_images = @user.post_images.page(params[:page])
              # メソッド 1:N の関係性 [1] (アソシエーション)
              # .ページ送り機能
       
   end
   
   
   def edit
       
       @book_image = Book.new
       
      
   end
   
   
   def update
       
        
   end
   
   
   
end
