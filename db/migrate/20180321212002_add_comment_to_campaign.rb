class AddCommentToCampaign < ActiveRecord::Migration[5.1]
  def change
    add_reference :campaigns, :comment, foreign_key: true
  end
end
