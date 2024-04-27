class CreateCallForIdeas < ActiveRecord::Migration[6.1]
  def change
    create_table :call_for_ideas do |t|

      t.timestamps
    end
  end
end
