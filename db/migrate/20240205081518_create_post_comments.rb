class CreatePostComments < ActiveRecord::Migration[6.1]
  def change
    create_table :post_comments do |t|
      t.text :comment, null: false
      t.integer :user_id
      t.integer :post_idea_id

      t.timestamps
    end
  end
end
