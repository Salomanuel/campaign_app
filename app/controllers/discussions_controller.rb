class DiscussionsController < ApplicationController
  def index
    @user = User.first
    @discussions = Discussion.all
  end

  def create
    @discussion = current_user.build_discussion(discussion_params)
    if @discussion.save
      flash[:success] = "Discussion created!"
      redirect_to current_user
    else
      flash[:danger] = "we may have a problem"
      render 'new'
    end
  end

  def show
    @discussion = Discussion.find(params[:id])
    @campaigns = @discussion.campaigns
    @comments = @discussion.comments
    @comment = Comment.new
  end

  private
    def discussion_params
      params.require(:discussion).permit(:title)
    end
end
