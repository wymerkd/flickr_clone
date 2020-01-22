class Comment < ApplicationRecord
  belongs_to(:photos)
  validates :content, presence: true
  validates :user_id, presence: true
  validates :photo_id, presence: true
end
