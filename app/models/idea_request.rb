class IdeaRequest < ApplicationRecord
  has_rich_text :content
  belongs_to :user
  has_one :call_for_idea
  validates :email, presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :title, presence: true
  validates :telephone_number, presence: true
  enum status: { adjustment: 0, recruiting: 1, recruitment_closed: 2 }
end
