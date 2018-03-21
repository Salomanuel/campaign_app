class CommentsController < ApplicationController

  def create
    @comment = current_user.comments.build(comment_params)
    # @discussion = 
    if @comment.save
      flash[:success] = "Comment created!"
      # redirect_to discussion
    else
      flash[:danger] = "Comment not saved"
      render 'new'
    end
  end


  private
    def comment_params
      params.require(:comment).permit(:title, :discussion_id)
    end
end
