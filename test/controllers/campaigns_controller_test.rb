require "test_helper"

describe CampaignsController do
# #   # it "must be a real test" do
# #   #   flunk "Need real tests"
# #   # end
# # end
# class CampaignsControllerTest < ActionDispatch::IntegrationTest

  def setup
    @campaign = campaigns(:one)
  end

  test "should redirect create when not logged in" do
    assert_no_difference "Campaign.count" do
      post campaigns_path, params: { campaign: { content: "Lorem" } }
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference "Campaign.count" do
      delete campaign_path(@campaign)
    end
    assert_redirected_to login_url
  end
end