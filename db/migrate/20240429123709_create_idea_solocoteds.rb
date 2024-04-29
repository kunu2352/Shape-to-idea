class CreateIdeaSolocoteds < ActiveRecord::Migration[6.1]
  def change
    create_table :idea_solocoteds do |t|

      t.timestamps
    end
  end
end
