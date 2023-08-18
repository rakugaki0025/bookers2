class CreateHomes < ActiveRecord::Migration[6.1]
        # bookers2_db_migrate_homes_table
        
  def change
    create_table :homes do |t|
      
      # t.string :shop_name # t.データ型 :カラム名
      # t.text :caption     # t.データ型 :カラム名
      # t.integer :user_id  # t.データ型 :カラム名

      # t.string :title     # t.データ型 :カラム名
      # t.string :body      # t.データ型 :カラム名
      
      t.timestamps
    end
  end
end
