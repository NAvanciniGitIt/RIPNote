class PostsController < ApplicationController
  
  def show
    @post = Post.find(params[:id])
    # binding.pry
  end

  def index
    @posts = Post.all
  end
    
  def new
    # binding.pry
    @post = Post.new 
    @dcd = Dcd.find(params[:dcd_id])
    render :new_dcd_post
  end
  
  def create
    @post = Post.new(post_params)
    @dcd = Dcd.find_by(params[:dcd_id])
    if @post.save
      redirect_to dcds_path
    else
      flash.now[:error] = @post.errors.full_messages
      render :new_dcd_post
    end
  end


  private 

  def post_params
    params.require(:post).permit(:title, :post_content, :user_id, :dcd_id, :picture)
  end
end