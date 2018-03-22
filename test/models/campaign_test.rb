require 'test_helper'

class CampaignTest < ActiveSupport::TestCase
  def setup
    @user = users(:manuel)
    @discussion = Discussion.create(title: "Discuss")
    @campaign = @user.campaigns.build(title: "Lorem ipsum", purpose: "doge", discussion_id: @discussion.id)
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

  test "purpose should be present" do
    @campaign.purpose = "   "
    assert_not @campaign.valid?
  end
end