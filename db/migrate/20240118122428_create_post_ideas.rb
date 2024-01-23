class CreatePostIdeas < ActiveRecord::Migration[6.1]
  def change
    create_table :post_ideas do |t|
      t.integer :user_post_id, null: false
      t.integer :categoty_id, null: false
      t.string :title, null: false
      t.integer :status, default: 0, null: false
      t.text :free_body
      t.text :paid_post
      t.boolean :premium
      t.timestamps
    end
  end
end
