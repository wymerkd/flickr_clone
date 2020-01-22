class Photo < ApplicationRecord
  has_many(:commments)
  has_many(:tags)
  validates :title, presence: true
  validates :user_id, presence: true
end
