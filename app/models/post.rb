class Post < ApplicationRecord

  validates_presence_of :title, :url, :photo, :description, :delivery, :price, :goal, :due_time

  mount_uploader :photo, AvatarImageUploader  
  has_many :replies, dependent: :destroy
  belongs_to :user
  has_many :participates, dependent: :destroy
  has_many :participated_user, through: :participates, source: :user
  has_one :postend

  def is_participated?(user)
    self.participated_user.include?(user)
  end

  def opening?
    !over_due? && post_opening? 
  end

  def ending?
    !over_due? && post_ending? 
  end

  def unfinished?
    over_due? || post_unfinished?
  end

  private

  def over_due?
    Time.now > due_time
  end

  def post_opening?
    self.status == "開團中"
  end

  def post_ending?
    self.status == "已結團"
  end

  def post_unfinished?
    self.status == "已流團"
  end

end
