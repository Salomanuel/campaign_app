class Discussion < ApplicationRecord
  has_many :campaigns
  has_many :comments
end
