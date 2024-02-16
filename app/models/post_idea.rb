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


# public def get_post_idea_image(size)
#   unless post_image.attached?
#     file_path = Rails.root.join('app/assets/images/free_ikon.jpg')
#     post_image.attach(io: File.open(file_path), filename: 'default_ikon.jpg', content_type: 'image/jpeg')
#   end
#   post_image.variant(resize_to_limit: size).processed
# end