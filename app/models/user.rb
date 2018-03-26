class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  validates :email, uniqueness: true
  validates :email, presence: true

  validates :username, uniqueness: true
  validates :username, presence: true


  has_many :notes, dependent: :destroy
  has_many :likes, dependent: :destroy

  has_many :active_relationships, foreign_key: "follower_id" , class_name: "Follow" , dependent: :destroy
  has_many :passive_relationships, foreign_key: "follower_id" ,class_name: "Follow" , dependent: :destroy

  has_many :followings, through: :active_relationships, source: :following
  has_many :followers, through: :passive_relationships, source: :follower




  def follow(other)
    active_relationships.create(following_id: other.id)
  end
  

  def unfollow(other)
    active_relationships.find_by(following_id: other.id).destroy
  end


  def following?(other)
    followings.include?(other)
  end
end
