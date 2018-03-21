class CreateCampaigns < ActiveRecord::Migration[5.1]
  def change
    create_table :campaigns do |t|
      t.string :title
      t.string :purpose
      t.boolean :estimated_duration
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :campaigns, [:user_id, :created_at]
  end
end
