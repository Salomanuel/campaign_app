class Campaign < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :title,   presence: true, length: { maximum: 140 }
  validates :purpose, presence: true
end
