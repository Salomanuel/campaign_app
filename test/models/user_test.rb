require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(     email: "user@example.com",
                       username: "Example User",
                       password: "banana",
                       password_confirmation: "banana")
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

  test "email validation should accept valid addresses" do
    valid_addresses = [ "user@example.com", 
                        "USER@foo.COM",
                        "A_US-ER@foo.bar.org", 
                        "first.last@foo.jp", 
                        "alice+bob@baz.cn",
                        "marco99@example.com" ]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test "email validation should REJECT invalid addresses" do
    invalid_addresses = [ "user@example,com",
                          "user_at_foo.org",
                          "user.name@example.foo@bar_baz.com",
                          "foo@bar+baz.com"]#,
                          # "foo@bar..com" ]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} should be INVALID"
    end       
  end

  test "email addresses should be unique" do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end

  test "email addresses should be saved as lower-case" do
    # skip
    mixed_case_email = "Foo@ExAMPle.CoM"
    @user.email = mixed_case_email
    @user.save
    assert_equal mixed_case_email.downcase, @user.reload.email
  end

  test "password should not be blank" do
    @user.password = "    "
    assert_not @user.valid?
  end

  test "password should have a minimum length" do
    @user.password = "a" * 5
    assert_not @user.valid?
  end

  test "associated campaigns should be destroyed" do
    @user.save
    @discussion = Discussion.create(title: "Discuss")
    @user.campaigns.create(title: "Lorem", purpose:"turtles", discussion_id: @discussion.id)
    assert_difference "Campaign.count", -1 do
      @user.destroy
    end
  end
end
