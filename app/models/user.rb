class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_one_attached :user_image       
  has_many :purchases, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :post_ideas, through: :purchase
  #購入した投稿との紐づけ
  has_many :post_ideas
  #自身の投稿との紐づけ
  
  validates :name, uniqueness: true
  
  def to_param
    name
  end
  
end
