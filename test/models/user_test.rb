require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(     email: "user@example.com",
                       username: "Example User")
  end

  test "should be valid" do
    assert @user.valid?
  end
end
