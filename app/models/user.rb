class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :book_comment, dependent: :destroy
  
  # フォローをした、されたの関係↓
  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  # 一覧画面で使う↓
  has_many :followings, through: :relationships, source: :followed # 自分がフォローしている人
  has_many :followers, through: :reverse_of_relationships, source: :follower # 自分をフォローしている人
  
  # フォローしたときの処理
  def follow(user_id)
    relationships.create(followed_id: user_id)
  end
  # フォローを外すときの処理
  def unfollow(user_id)
    relationships.find_by(followed_id: user_id).destroy
  end
  # フォローしているか判定
  def following?(user)
    followings.include?(user)
  end
  
  validates :name, uniqueness: true
  validates :name, length: { in: 2..20 }
  validates :introduction, length: {maximum: 50}
  attachment :profile_image
end