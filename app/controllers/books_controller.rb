class BooksController < ApplicationController
      # bookers2_app_controllers
   
  def show
      
      @book = Book.find(params[:id])
        # データ（レコード）を1件取得
        
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
      
      is_matching_login_user
      
      @book = Book.find(params[:id])
        # データ（レコード）を1件取得
        
      @user = @book.user
        # ログイン中の個人を特定する
  
  end
  
  
  def create
         # New Book
         # 投稿データの保存
         
      @book = Book.new(book_image_params)
         # title, body, image 格納予定
         
      @book.user_id = current_user.id
         # ユーザーを ID で特定するために使用するカラム
         # current_user.id(今ログインしているユーザーの ID)
         
      if @book.save
           # 記録保存が成功すれば投稿一覧へ
           
         flash[:notice] = "You have created book successfully."
           # flash[:notice] は 投稿が成功した時だけ
           # エラーメッセージでは使わない
           
         redirect_to book_path(@book.id)
           # 遷移先 投稿一覧画面 book_path
         
      else
         
         ##@book = Book.new
           ## ここにいれてしまうとエラーメッセージが表示されなくなる@user = current_user
           ## 元々の空箱をうわがきしてしまう
           
         @user = current_user
          # ログイン中の個人を特定する
         
         @books_lists = Book.all
          # 本のデータ
         
           # エラー時の遷移先
         render :index
         
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
           
      #@book.user_id = current_user.id
                
      if  @book.update(book_image_params)
            # saveメソッド
           
          flash[:notice] = "You have updated book successfully."
            # flash[:notice] は 投稿が成功した時だけ
            # エラーメッセージでは使わない
            
          redirect_to book_path(@book.id)
            # アクションを実行する
           
      else
           render :edit
             # アクションを実行しない
      end
  end
  
  
  def is_matching_login_user
              # ログインしているユーザーのidとURLに含まれるidを比較し、
              # 一致しなければ投稿画像一覧ページに移動する処理
              # 各コントローラーに記述しないとエラーの原因にもなる
              
      book = Book.new
              # ローカル変数 = ユーザー_find 探す:単数でどれか一つ
              # URLを参考に特定のidを持ったレコードを取得する
          
      unless book.id == current_user.id
              # ログイン中,ユーザーid,取得
          
      redirect_to books_path
              # 遷移先 Books#index 投稿画像一覧へ
          
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

