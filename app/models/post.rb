class Post < ApplicationRecord
  mount_uploader :photo, AvatarImageUploader  
end
