class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books,dependent: :destroy
  has_many :favorites,dependent: :destroy
  has_many :book_comments,dependent: :destroy

  # フォロー・フォロワー機能に関する記述
  has_many :follower,class_name: "Relationship",foreign_key: "follower_id", dependent: :destroy
  has_many :followed,class_name: "Relationship",foreign_key: "followed_id",dependent: :destroy
  has_many :following_user,through: :follower,source: :followed
  has_many :follower_user, through: :followed,source: :follower

  # チャットに関する記述
  has_many :user_rooms,dependent: :destroy
  has_many :chats,dependent: :destroy

  attachment :profile_image

  validates :name,presence: true,length: {maximum:20,minimum:2}
  validates :introduction, length:{maximum:50}
  validates :postcode,presence: true
  validates :address_city,presence: true
  validates :address_street,presence: true
  validates :address_building,presence: true

  def follow(user_id)
    follower.create(followed_id: user_id)
  end

  def unfollow(user_id)
    follower.find_by(followed_id: user_id).destroy
  end

  def following?(user)
    following_user.include?(user)
  end

  include JpPrefecture
jp_prefecture :prefecture_code

def prefecture_name
  JpPrefecture::Prefecture.find(code: prefecture_code).try(:name)
end

def prefecture_name=(prefecture_name)
  self.prefecture_code = JpPrefecture::Prefecture.find(name: prefecture_name).code
end

end
