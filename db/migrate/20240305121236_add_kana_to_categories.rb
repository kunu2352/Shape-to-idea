class AddKanaToCategories < ActiveRecord::Migration[6.1]
  def change
    add_column :categories, :kana, :string
  end
end
