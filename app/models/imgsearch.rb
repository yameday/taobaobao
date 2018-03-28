class Imgsearch < ApplicationRecord
  mount_uploader :photo, ImgUploader
end
