class CommentsController < ApplicationController
before_action :find_dcd
before_action :find_post
before_action :find_comments, only: [:edit, :update, :destroy]
before_action :redirect_if_not_dcd_user, only: [:edit, :update, :destroy]
before_action :redirect_if_no_comment, only: [:update, :destroy]

  def index
    @comments = Comment.all
  end

  def new
   
  end

  def create
    @comment = Comment.new(comment_params)
      @post = @comment.post
      if @comment.save
        redirect_to dcd_post_path(@dcd, @post)
      else
        flash.now[:error] = @comment.errors.full_messages
        render :'posts/show'
      end
    end 
    
    def edit
      redirect_if_not_dcd_user
    end
    
  def update
    @comment.update(comment_params)
    redirect_if_not_dcd_user
    if @comment.save
      redirect_to dcd_post_path(@dcd, @post)
    else
      flash.now[:error] = @comment.errors.full_messages
      render :edit
    end
  end
  
  def destroy
    @comment.destroy
    redirect_to dcd_post_path(@dcd, @post)
  end
  
  private
  
  def comment_params
    params.require(:comment).permit(:content, :user_id, :post_id, comments_attributes: [:user_id, :post_id, :content])
  end
  
  def find_comments
    @comment = Comment.find_by_id(params[:id])
  end
  
  def redirect_if_not_dcd_user
    redirect_to dcd_posts_path unless current_user.id == @comment.user_id 
  end
  
  def find_post
    @post = Post.find_by_id(params[:post_id])
  end

  def redirect_if_no_comment
    # binding.pry
    redirect_to dcd_post_path(@post) unless @comment 
  end 
end
