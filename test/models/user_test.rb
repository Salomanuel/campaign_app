require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(     email: "user@example.com",
                       username: "Example User")
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "username should be present" do
    @user.username = "     "
    assert_not @user.valid?
  end

  test "username should not be too long" do
    @user.username = "a" * 51
    assert_not @user.valid?
  end

  test "email should be present" do
    @user.email = "      "
    assert_not @user.valid?
  end

  test "email should not be too long" do
    @user.email = "a" * 244 + "@example.com"
    assert_not @user.valid?
  end
end
