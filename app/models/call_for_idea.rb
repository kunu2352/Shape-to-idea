class CallForIdea < ApplicationRecord
  has_many :ideas_solicited, dependent: :destroy
  has_one_attached :recruitment_image
  has_one :user 
end
