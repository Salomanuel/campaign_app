require "test_helper"

describe Discussion do
  let(:discussion) { Discussion.new }

  it "must be valid" do
    value(discussion).must_be :valid?
  end
end
