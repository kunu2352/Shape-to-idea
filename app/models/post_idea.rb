class PostIdea < ApplicationRecord
  has_one_attached :post_image

  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  belongs_to :category
  has_many :purchases
  has_many :users, through: :purchases
  #投稿購入者と投稿の紐づけ
  belongs_to :user
  #投稿との紐付け用

  # validates :price, presence: true, numericality: { greater_than_or_equal_to: 1, less_than: 5000000 }

  enum status: { published: 0, draft: 1,unpublished: 2 }
  
  
  def favorited_by(user)
    favorites.exists?(user_id: user.id)
  end
  
  def self.looks(word)
    @post_idea = PostIdea.where("title LIKE?","%#{word}%")
  end
end
