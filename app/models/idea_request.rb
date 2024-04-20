class IdeaRequest < ApplicationRecord
  has_rich_text :content
  belongs_to :user
  
  enum status: { adjustment: 0, recruiting: 1, recruitment_closed: 2 }
end
