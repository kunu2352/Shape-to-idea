class PostComment < ApplicationRecord
  belongs_to :user
  belongs_to :post_idea

  validates :comment,  length: { minimum: 5, maximum: 300 }, presence: { message: "300字までになります" }


end
