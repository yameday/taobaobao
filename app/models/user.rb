class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  mount_uploader :avatar, AvatarImageUploader  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :email, uniqueness: true
  validates :name, uniqueness: true
  has_many :posts, dependent: :destroy
  has_many :replies, dependent: :destroy
  has_many :participates, dependent: :destroy
  has_many :participated_post, through: :participates, source: :post
end
