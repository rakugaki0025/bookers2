class User < ApplicationRecord
    
       # bookers2_app_models_user
  
       # Include default devise modules. Others available are:
       # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
          # パスワードの正確性
          # ユーザー登録や編集,削除
          # パスワードをリセット
          # ログイン情報を保存
          # emailのフォーマットなどのバリデーション
   
   has_many :book_images, dependent: :destroy
          # たくさん持っている:モデルが 1:N になるよう関連付け:削除
   
   has_one_attached :profile_image
          # profile_imageという名前でActiveStorageで
          # プロフィール画像を保存できるように設定
          
  def get_profile_image(width, height)
        # 取得_特定の名前(引数= 幅,高さ)
        # 特定の処理を名前で呼び出すことが可能
        # カラムを呼び出すようにこの処理（メソッド）を
        # 呼び出すことができる
    unless profile_image.attached?
        #
       file_path = Rails.root.join('app/assets/images/sample-author1.jpg')
        # 
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
        #
    end
    
    profile_image.variant(resize_to_limit: [width, height]).processed
        # 画像サイズの変換 [引数(メソッドに渡す値)= 幅,高さ]
        # 例, get_profile_image(数値, 200)
  end
             
end
   
   
   

