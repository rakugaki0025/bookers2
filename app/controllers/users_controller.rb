class UsersController < ApplicationController
              # bookers2_app_controller_users
   
   #before_action :is_matching_login_user, only: [:edit, :update]
              # "edit"と"update"のアクションの実行前に、
              # "is_matching_login_user"を実行させる記述
   
   
   def show
       
       @book = Book.new
              # インスタンス変数 = モデル名 空オブジェクト 新規作成
              # 左の箱に右を格納
              # インスタンス名はなんでもいい,空のオブジェクトもなんでもいい
         
       @user = User.find(params[:id])
              # インスタンス変数 = ユーザー_find 探す:単数でどれか一つ
              
       @books = @user.books
       
       #@post_images = @user.post_images.page(params[:page])
              # メソッド 1:N の関係性 [1] (アソシエーション)
              # .ページ送り機能
       
   end
   
   
   def index
       
       @book = Book.new
        # インスタンス変数 = モデル名 空オブジェクト 新規作成
        # 左の箱に右を格納
        # インスタンス名はなんでもいい,空のオブジェクトもなんでもいい
       
       
       @user = current_user
              # ログイン中の個人のユーザー
              
       @users = User.all
   
   end
   
   
   def edit
       
       @user = User.find(params[:id])
              # URLを参考に特定のidを持ったレコードを取得する
       
       @book_image = Book.new
              # 
      
   end
   
   
   def update
       
       @user = User.find(params[:id])
              # インスタンス変数 = ユーザー_find 探す:単数でどれか一つ
              # レコードを一つ取得？
       
       if 
           @user.update(user_params)
              # ユーザーのアップデート
          
           redirect_to user_path(@user.id)
              # インスタンス変数 = ユーザー_find 探す:単数でどれか一つ  user_path(@user.id)
              # 遷移先 '/books'? user_path(@user.id)
       else
           
           render :edit
              # アクションを実行しない
       end
   end
   
   
   private
   
   
   def user_params
              # 
              
      params.require(:user).permit(:name, :profile_image, :introduction)
              # require :モデル名
              # permit  :userの書き込みを許可してあげる？
              # params.require(:モデル名).
              # permit(:保存を許可するカラム指定)
   end
    
    
   def is_matching_login_user
              # ログインしているユーザーのidとURLに含まれるidを比較し、
              # 一致しなければ投稿画像一覧ページに移動する処理
          
       user = User.find(params[:id])
              # ローカル変数 = ユーザー_find 探す:単数でどれか一つ
              # URLを参考に特定のidを持ったレコードを取得する
          
       unless user.id == current_user.id
              # ログイン中,ユーザーid,取得
          
       redirect_to books_path
              # 遷移先 Books#index 投稿画像一覧へ
          
       end
   end
   
end

