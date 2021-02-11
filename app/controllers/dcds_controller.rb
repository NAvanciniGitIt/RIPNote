class DcdsController < ApplicationController
  before_action :find_dcd, only: [:show, :edit, :destroy, :update, :search]
  
#dcd = Deceased

  def index 
    @dcds = Dcd.all
    # @search = params["search"]
    # if @search.present?
    #   @first_name = @search["first_name"]
    #   @dcds = Dcd.where("first_name LIKE ?", "%#{@first_name}%")
    # end
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
        error
        render :new
    end
  end 

  def edit
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
    @dcd.destroy
    flash[:notice] = "#{@dcd.first_name} was successfully removed."
    redirect_to dcds_path
  end

  private

  def find_dcd
    @dcd = Dcd.find_by_id(params[:id])
  end 

  def dcd_params #permit only the attributes we added to our object
    params.require(:dcd).permit(:first_name, :last_name, :relationship, :gender, :birthday, :deathday, :picture, :search)
  end 
  
  def error
    flash.now[:error] = @dcd.errors.full_messages
  end
end
