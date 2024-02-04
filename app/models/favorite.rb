class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :post_idea
  validates :user_id, uniqueness: {scope: :post_idea_id}
  
  
  
end
