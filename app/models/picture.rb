class Picture < ApplicationRecord
  belongs_to :user
  has_many :titles
  
  mount_uploader :image, ImageUploader
  
end
