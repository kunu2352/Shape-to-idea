class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :post_idea
  
end
