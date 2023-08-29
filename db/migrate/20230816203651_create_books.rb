class CreateBooks < ActiveRecord::Migration[6.1]
      # bookers2_db_migrate_Books_table
      
  def change
    create_table :books do |t|
              # テーブル名 カラム作成
              
      t.string :title # t.データ型 :カラム名 お店の名前
      t.text :body     # t.データ型 :カラム名 座像の説明
      t.integer :user_id  # t.データ型 :カラム名 ユーザーを識別するID
      
      t.timestamps
    end
  end
end
