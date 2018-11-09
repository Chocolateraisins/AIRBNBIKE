class BikesController < ApplicationController

  def show
    @bike = Bike.find(params[:id])
  end

  def index
    # if params.key? "filter"
    #   @bikes = Bike.where(category: params[:filter])
    # else
    @bikes = Bike.all
    # end

  end


  def new
    @bike = Bike.new
  end

  def create
    @bike = Bike.new(bike_params)
    @bike.user = current_user
    if @bike.save
      redirect_to bike_path(@bike)
    else
      render :new
    end
  end


  def edit
  end

  private

  def bike_params
    params.require(:bike).permit(:category, :price, :brand, :engine_size)
  end
end
