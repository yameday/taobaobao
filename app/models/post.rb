class Post < ApplicationRecord

  validates_presence_of :title, :url, :photo, :description, :delivery, :price, :goal, :due_time

  mount_uploader :photo, AvatarImageUploader  
  has_many :replies
  belongs_to :user
  has_many :participates, dependent: :destroy
  has_many :participated_user, through: :participates, source: :user

  def is_participated?(user)
    self.participated_user.include?(user)
  end

end
