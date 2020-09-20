class Title < ApplicationRecord
  belongs_to :user
  belongs_to :picture
  
  validates :title, presence: true, length: { maximum: 255 }
end
