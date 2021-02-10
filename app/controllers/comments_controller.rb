class CommentsController < ApplicationController

  def new
    
  end

  def create
    @comment = Comment.new(comment_params)
      @post = @comment.post
      if @comment.save
        redirect_to post_path(@comment.post)
      else
        render :post_show
      end
  end 

  

  private

  def comment_params
    params.require(:comment).permit(:content, :user_id, :post_id)
  end
end
