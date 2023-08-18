class BooksController < ApplicationController
      # bookers2_app_controllers
   
  def new
      
      @book_image = Book.new
        # インスタンス変数 = モデル名.rb 空オブジェクト 新規作成
        # 左の箱に右を格納
        # インスタンス名はなんでもいい,空のオブジェクトもなんでもいい
      
  end
  
  
  def index

      @book_image = Book.new
        # # インスタンス変数 = モデル名 空オブジェクト 新規作成
        # 左の箱に右を格納
        # インスタンス名はなんでもいい,空のオブジェクトもなんでもいい
        
      @books_images = Book.all
        # 
        
      # @book_images = Book.page(params[:page])
        # インスタンス変数 = モデル名.ページ送り機能
  
  end
  
  
  def show
  
  end
  
  
  def create
         #投稿データの保存
         
      @book_image = Book.new(book_image_params)
         # shop_name, caption,image 格納予定
         
      @book_image.user_id = current_user.id
         # ユーザーを ID で特定するために使用するカラム
         # current_user.id(今ログインしているユーザーの ID)
         
      @book_image.save
         # 記録保存が成功すれば投稿一覧へ
         
      redirect_to books_path
         # 遷移先 投稿一覧画面 books_about_path
  end 
  
  
  def destroy
      
  end
  
  
  private
       # 投稿データのストロングパラメータ 
       # マスアサインメント虚弱性(params)を防ぐ
       # ここから下はこのcontrollerの中でしか呼び出せません
  
  def book_image_params
       # モデル名と一緒
       
    params.require(:book).permit(:shop_name, :image, :caption)
       # params.require(:モデル名).permit(:保存を許可するカラム指定)
       
  end
  
end

