class DcdsController < ApplicationController
  before_action :find_dcd, only: [:show, :edit, :destroy, :update]
  
#dcd = Deceased

  def index 
    @dcds = Dcd.all
  end

  def show
    # binding.pry
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
        redirect_to dcds_path #singular to show page? 
      else 
        flash.now[:error] = @dcd.errors.full_messages
        render :new
    end
  end 

  def edit
  end 

  def update
    if @dcd.update(dcd_params)
      redirect_to dcd_path(@dcd)
    else
      flash.now[:error] = @dcd.errors.full_messages
      render :edit
    end
  end 

  def destroy 
    @dcd.destroy
    flash[:notice] = "#{@dcd.first_name} was successfully removed."
    redirect_to dcds_path
  end

  private

  def find_dcd
    @dcd = Dcd.find_by_id(params[:id])
  end 

  def dcd_params #permit only the attributes we added to our object
    params.require(:dcd).permit(:first_name, :last_name, :relationship, :gender, :birthday, :deathday, :picture)
  end 
  
end
