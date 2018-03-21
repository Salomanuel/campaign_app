require 'test_helper'

class CampaignTest < ActiveSupport::TestCase
  def setup
    @user = users(:manuel)

    @campaign = Campaign.new(title: "Lorem ipsum", user_id: @user.id)
  end

  test "should be valid" do
    assert @campaign.valid?
  end

  test "user id should be present" do
    @campaign.user_id = nil
    assert_not @campaign.valid?
  end

  test "title should be present" do 
    @campaign.title = "    "
    assert_not @campaign.valid?
  end

  test "title should be at most 140 chars" do
    @campaign.title = "z" * 141
    assert_not @campaign.valid?
  end
end