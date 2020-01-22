class Tag < ApplicationRecord
  belongs_to(:photos)
  validates :photo_id, presence: true
  validates :name, presence: true
end
