class Title < ApplicationRecord
  belongs_to :user, inverse_of: :titles
  belongs_to :picture, inverse_of: :titles
  
  validates :title, presence: true, length: { maximum: 255 }
end
