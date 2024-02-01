class PostIdea < ApplicationRecord

  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  belongs_to :category
  has_many :purchases
  has_many :users, through: :purchases
  #投稿購入者と投稿の紐づけ
  belongs_to :user
  #投稿との紐付け用
  
  # validates :price, presence: true, numericality: { greater_than_or_equal_to: 1, less_than: 5000000 }
  
  enum status: { published: 0, draft: 1,unpublished: 2 }
end
