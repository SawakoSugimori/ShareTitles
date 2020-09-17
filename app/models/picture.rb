class Picture < ApplicationRecord
  belongs_to :user
  belongs_to :title, optional: true
  
  mount_uploader :image, ImageUploader
  
end
