class DiscussionsController < ApplicationController
  def index
    @user = User.first
    @discussions = Discussion.all
  end

  def show
    @discussion = Discussion.find(params[:id])
    @campaigns = @discussion.campaigns
    @comments = @discussion.comments
  end
end
