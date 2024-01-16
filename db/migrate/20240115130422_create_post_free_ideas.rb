class CreatePostFreeIdeas < ActiveRecord::Migration[6.1]
  def change
    create_table :post_free_ideas do |t|
      t.integer :user_id, null: false
       t.integer :category_id, null: false
       t.string :title, null: false
       t.text :body,null: false
       t.integer :status, default: 0, null: false
       
      t.timestamps
    end
  end
end
