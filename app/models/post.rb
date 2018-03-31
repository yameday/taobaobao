class Post < ApplicationRecord

  validates_presence_of :title, :url, :photo, :description, :delivery, :price, :goal, :due_time

  mount_uploader :photo, AvatarImageUploader  
  has_many :replies, dependent: :destroy
  belongs_to :user
  has_many :participates, dependent: :destroy
  has_many :participated_user, through: :participates, source: :user

  def is_participated?(user)
    self.participated_user.include?(user)
  end

  def opening?
    !over_due?
  end

  private

  def over_due?
    Time.now > due_time
  end

end
