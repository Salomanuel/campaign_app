class Discussion < ApplicationRecord
  has_many :campaigns
  has_many :comments
  belongs_to :user
end
