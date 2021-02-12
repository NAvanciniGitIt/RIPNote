class ApplicationController < ActionController::Base

  

  # def find_post(post)
  #   @post = Post.find_by_id(post) #creating dynamic method works between multiple controllers -- pass in params within this method and does the query for me 
  # end

  def find_dcd
    @dcd = Dcd.find_by_id(params[:dcd_id])
  end
end
