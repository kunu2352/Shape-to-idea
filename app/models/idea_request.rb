class IdeaRequest < ApplicationRecord
  has_rich_text :content
  belongs_to :user
  has_one :call_for_idea
  
  enum status: { adjustment: 0, recruiting: 1, recruitment_closed: 2 }
end
