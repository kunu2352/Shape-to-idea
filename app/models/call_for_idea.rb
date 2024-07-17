class CallForIdea < ApplicationRecord
  has_many :ideas_solicited, dependent: :destroy
  has_one_attached :recruitment_image_banner
  has_one_attached :recruitment_image
  belongs_to :user
  has_many :users, through: :idea_request
  
  belongs_to :idea_request
end
