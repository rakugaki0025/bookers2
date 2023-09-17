class BooksController < ApplicationController
      # bookers2_app_controllers
   
  def show
      
      @book = Book.find(params[:id])
        #
        
      @user = @book.user
        # ログイン中の個人を特定する
        
      
  end
  
        # 投稿の一覧
  def index

      @book = Book.new
        # インスタンス変数 = モデル名 空オブジェクト 新規作成
        # 左の箱に右を格納
        # インスタンス名はなんでもいい,空のオブジェクトもなんでもいい
      
      @user = current_user
        # ログイン中の個人を特定する
      
      @books_lists = Book.all
        # 全ユーザーデータ取得
     
  end

  
  def edit
      
      @book = Book.find(params[:id])
        #
        
      @user = @book.user
        # ログイン中の個人を特定する
  
  end
  
  
  def create
         # New Book
         # 投稿データの保存
         
      @book_image = Book.new(book_image_params)
         # shop_name, caption,image 格納予定
         
      @book_image.user_id = current_user.id
         # ユーザーを ID で特定するために使用するカラム
         # current_user.id(今ログインしているユーザーの ID)
         
      if 
         @book_image.save
           # 記録保存が成功すれば投稿一覧へ
         flash[:notice] = "You have created book successfully."
         
         redirect_to book_path(@book_image)
           # 遷移先 投稿一覧画面 book_path
         
      else 
           # エラーメッセージ
         flash[:notice] = "errors prohibited this obj from being saved:"
           
           # エラー時の遷移先
         render :show
         
      end
  end
  
  
  def destroy
      @book = Book.find(params[:id])
        # データ（レコード）を1件取得
        
      @book.destroy
        # データ（レコード）を削除
      
      redirect_to '/books'
        # 投稿一覧画面へリダイレクト  
  end
  
  
  def update
           # Editing book
      @book = Book.find(params[:id])
           # データ（レコード）を1件取得
           
      @book.user_id = current_user.id
                
      if 
          @book.update(book_image_params)
            # saveメソッド
           
          flash[:notice] = "Book was successfully updated."
            # 3. フラッシュメッセージを定義し、詳細画面へリダイレクト
          redirect_to book_path(@book.id)
            # アクションを実行する
           
      else
           render :show
             # アクションを実行しない
      end
  end
  
  
  private
       # 投稿データのストロングパラメータ 
       # マスアサインメント虚弱性(params)を防ぐ
       # ここから下はこのcontrollerの中でしか呼び出せません
  
  def book_image_params
       # モデル名と一緒
       
    params.require(:book).permit(:title, :body, :image)
       # params.require(:モデル名).permit(:保存を許可するカラム指定)
       
  end
end

