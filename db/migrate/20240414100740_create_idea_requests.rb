class CreateIdeaRequests < ActiveRecord::Migration[6.1]
  def change
    create_table :idea_requests do |t|
      t.integer :user_id, null: false
      t.string :title, null: false
      t.integer :status, default: 0, null: false
      t.integer :telephone_number, null: false
      t.integer :email, null: false
      
      t.timestamps
    end
  end
end
