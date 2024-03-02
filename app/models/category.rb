class Category < ApplicationRecord
  has_many :post_ideas, dependent: :destroy
end
