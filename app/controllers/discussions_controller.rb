class DiscussionsController < ApplicationController
  def index
    @user = User.first
    @discussions = Discussion.all
  end
end
