class Picture < ApplicationRecord
  belongs_to :user
  has_many :titles, inverse_of: :picture
  
  mount_uploader :image, ImageUploader
  
end
