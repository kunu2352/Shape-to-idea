class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_one_attached :user_image
  has_many :purchases, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :post_ideas, through: :favorite
  has_many :post_ideas, through: :purchase
  #購入した投稿との紐づけ
  has_many :post_ideas
  #自身の投稿との紐づけ
  
  validates :name, uniqueness: true
  
  def to_param
    name
  end
  
  def get_profile_image
    unless user_image.attached?
      file_path = Rails.root.join('app/assets/images/free_ikon.jpg')
      user_image.attach(io: File.open(file_path), filename: 'default_ikon.jpg', content_type: 'image/jpeg')
    end
    user_image.variant(resize_to_limit:[100,100]).processed
  end
  
  
  def self.looks(word)
    @user = User.where("name LIKE?","%#{word}%")
  end
  
  def self.guest
    find_or_create_by!(email: "guest@example.com") do |user| 
      user.password = SecureRandom.urlsafe_base64(6)
      user.name = "ゲストユーザー"
      user.telephone_number = 00000000000
    end
  end
  
end
