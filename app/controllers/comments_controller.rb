class CommentsController < ApplicationController
before_action :find_comments, only: [:edit, :update, :destroy]

  def index
    @comments = Comment.all
  end

  def new
    
  end

  def create
    @comment = Comment.new(comment_params)
      @post = @comment.post
      if @comment.save
        redirect_to post_path(@comment.post)
      else
        flash.now[:error] = @comment.errors.full_messages
        render :'posts/show'
      end
  end 

  def edit
      @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.update(comment_params)
      if @comment.save
        redirect_to post_path
      else
        flash.now[:error] = @comment.errors.full_messages
        render :edit
      end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :user_id, :post_id, comments_attributes: [:user_id, :post_id, :content])
  end

  def find_comments
    @comments = Comment.find_by_id(params[:id])
    @post = Post.find_by_id(@comments.post.id)
  end
end
