class AddDiscussionToCampaign < ActiveRecord::Migration[5.1]
  def change
    add_reference :campaigns, :discussion, foreign_key: true
  end
end
