class PostsController < ApplicationController
  before_action :find_dcd, only: [:new, :show]
  before_action :find_post, only: [:new, :create, :show]
  before_action :redirect_if_no_post, only: [:show]

  def show
    @comment = Comment.new
    # binding.pry
  end

  def index
    @posts = Post.all
  end
    
  def new
    # binding.pry
    @post = Post.new 
    render :new_dcd_post
  end
  
  def create
    @dcd = Dcd.find_by(params[:dcd_id])
    @post = Post.new(post_params)
    # binding.pry
    if @post.save
      # binding.pry
      redirect_to dcd_post_path(@dcd, @post)
    else
      flash.now[:error] = @post.errors.full_messages
      render :new_dcd_post
    end
  end
  
  
  private 
  
  def post_params
    params.require(:post).permit(:title, :post_content, :user_id, :dcd_id, :picture)
  end
  
  def redirect_if_no_post
    # binding.pry
    redirect_to dcd_posts_path unless @post
  end 

  def find_post
    @post = Post.find_by_id(params[:id])
  end 

end