class Post < ApplicationRecord
  mount_uploader :photo, AvatarImageUploader  
  has_many :replies
  belongs_to :user
end
