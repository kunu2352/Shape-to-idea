class CreatePostIdeas < ActiveRecord::Migration[6.1]
  def change
    create_table :post_ideas do |t|
      t.integer :user_id, null: false
      t.integer :category_id, null: false
      t.string :title, null: false
      t.integer :status, default: 0, null: false
      #投稿の下書き保存用
      t.text :free_body, null: false
      #無料投稿保存用
      t.text :paid_body
      #有料投稿保存用
      t.integer :price
      #有料投稿の値
      t.timestamps
    end
  end
end
