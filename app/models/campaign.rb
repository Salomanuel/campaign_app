class Campaign < ApplicationRecord
  belongs_to :user
  belongs_to :discussion
  has_many :comments
  has_many :taggings
  has_many :tags, through: :taggings
  validates :user_id, presence: true
  validates :title,   presence: true, length: { maximum: 140 }
  validates :purpose, presence: true

  def tag_list
    self.tags.collect do |tag|
      tag.name
    end.join(", ")
  end

  def tag_list=(tags_string)
  end
end
