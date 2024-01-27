class PostIdea < ApplicationRecord

  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  belongs_to :category
  has_many :purchases
  has_many :users, through: :purchases
  #投稿購入者と投稿の紐づけ
  belongs_to :user
  #投稿との紐付け用
  

end
