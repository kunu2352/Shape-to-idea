class CreateCallForIdeas < ActiveRecord::Migration[6.1]
  def change
    create_table :call_for_ideas do |t|
      t.string :title, null: false
      t.text :recruitment, null: false
      t.integer :user_id, null: false
      t.timestamps
    end
  end
end
