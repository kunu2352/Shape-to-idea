class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  validates :name, uniqueness: true, length: { minimum: 2, maximum: 10 }
  validates :introduction,  length: { maximum: 500 }
  validates :name, :telephone_number, presence: true
  
  
  has_one_attached :user_image
  has_many :purchases, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :post_ideas, through: :favorite
  #購入した投稿との紐づけ
  has_many :post_ideas, through: :purchase
  #自身の投稿との紐づけ
  has_many :post_ideas

  # フォロー機能
  has_many :active_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :possive_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :followings, through: :active_relationships, source: :followed
  has_many :followers, through: :possive_relationships, source: :follower
  has_many :call_for_ideas, through: :idea_requests
  has_many :call_for_ideas
  has_many :idea_requests
  
  # フォローする
  def follow(user)
    active_relationships.create!(followed_id: user.id)
  end
  
  # フォローを解除
  def unfollow(user)
    active_relationships.find_by(followed_id: user.id).destroy
  end
  
  def following?(user)
    followings.include?(user)
  end
  
  def to_param
    name
  end

  # 画像貼り付け
  def get_profile_image
    unless user_image.attached?
      file_path = Rails.root.join('app/assets/images/free_ikon.jpg')
      user_image.attach(io: File.open(file_path), filename: 'default_ikon.jpg', content_type: 'image/jpeg')
    end
    user_image.variant(resize_to_limit:[100,100]).processed
  end


  # 検索機能
  def self.looks(word)
    @user = User.where("name LIKE?","%#{word}%")
  end

  #ゲストログイン機能
  def self.guest
    find_or_create_by!(email: "guest@example.com") do |user|
      user.password = SecureRandom.urlsafe_base64(6)
      user.name = "ゲストユーザー"
      user.telephone_number = 00000000000
    end
  end
end
