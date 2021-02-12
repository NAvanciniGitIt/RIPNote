class DcdsController < ApplicationController
  before_action :find_dcds, only: [:show, :edit, :destroy, :update, :search]
  
  
#dcd = Deceased

  def index 
    @dcds = Dcd.all
    if params[:query]
      @dcds = @dcds.search(params[:query])
    end
  end

  def show
    #binding.pry
  end 

  def new
    if @post 
      render :new_dcd_post
     else
       @dcd = Dcd.new 
     end
  end

  def create
    @dcd = Dcd.new(dcd_params)
      if @dcd.save
        redirect_to dcds_path  
      else 
        error
        render :new
    end
  end 

  def edit
   
   redirect_if_not_dcd_user
  end 

  def update
    if @dcd.update(dcd_params)
      redirect_to dcd_path(@dcd)
    else
      error
      render :edit
    end
  end 

  def destroy 
    redirect_if_not_dcd_user
    @dcd.destroy
    flash[:notice] = "#{@dcd.full_name} was successfully removed."
    redirect_to dcds_path
  end

  private

  def find_dcds
    @dcd = Dcd.find_by_id(params[:id])
  end 

  def dcd_params #permit only the attributes we added to our object
    params.require(:dcd).permit(:first_name, :last_name, :relationship, :gender, :birthday, :deathday, :bio, :picture, :search, :user_id)
  end 
  
  def error
    flash.now[:error] = @dcd.errors.full_messages
  end

  def redirect_if_not_dcd_user
    redirect_to dcd_path(@dcd) unless current_user.id == @dcd.user_id
  end
end
