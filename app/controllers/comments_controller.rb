class CommentsController < ApplicationController

  def create
    @discussion = Discussion.new(params[:id])
    # @comment = @discussion.comments.build(comment_params)
    # @comment.discussion = Discussion.first
    # @comment.discussion = @discussion
    @comment = Comment.new(comment_params)

    if @comment.save
      flash[:success] = "Comment created!"
      redirect_to root_path
    else
      flash[:danger] = "Comment not saved"
      # redirect_to root_path
      render inline: "<h1>oh no</h1><p><%= @comment.errors.messages %>"
    end
  end


  private
    def comment_params
      params.require(:comment).permit(:title, :user_id, :discussion_id)
    end
end
