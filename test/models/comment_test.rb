require "test_helper"


class CommentTest < ActiveSupport::TestCase
  def setup
    @user = users(:manuel)
    @discussion = Discussion.create(title: "Discuss")
    @comment = @discussion.comments.build(user: @user)
  end

  describe "comment" do
    it "must be valid" do
      @comment.must_be :valid?
    end
  end
end