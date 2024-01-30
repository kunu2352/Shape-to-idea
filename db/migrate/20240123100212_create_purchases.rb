class CreatePurchases < ActiveRecord::Migration[6.1]
  def change
    create_table :purchases do |t|
      t.integer :user_id, null: false
      #購入したユーザーデータを保存
      t.integer :post_idea_id, null: false
      #購入された投稿データを保存
      # t.boolean :purchase_status, default: false, null: false
      #投稿が購入されているか。→必要？
      t.boolean :owner, default: false, null: false
      t.timestamps
    end
  end
end
