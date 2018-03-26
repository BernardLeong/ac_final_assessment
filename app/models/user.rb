class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :notes

  has_many :followships, dependent: :destroy
  has_many :followings, through: :followships
  
  def following?(user)
    self.followings.include?(user)
  end
  
end
