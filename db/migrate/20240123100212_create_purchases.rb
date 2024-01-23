class CreatePurchases < ActiveRecord::Migration[6.1]
  def change
    create_table :purchases do |t|
      t.integer :user_id, null: false
      t.imteger :post_idea_id, null: false
      t.boolean :purchase_status, default: false, null: false
      t.boolean :owner, default: false, null: false
      t.timestamps
    end
  end
end
