class BikesController < ApplicationController

  def show
    @bike = Bike.find(params[:id])
  end

  def index
    @categories = Bike.all.pluck(:category).uniq
    @brands = Bike.all.pluck(:brand).uniq
    @engines = Bike.all.pluck(:engine_size).uniq
    @prices = Bike.all.pluck(:price).uniq
    @bikes = Bike.all
    @bikes = @bikes.where(category: params[:filter_category]) if params[:filter_category].present?
    @bikes = @bikes.where(brand: params[:filter_brand]) if params[:filter_brand].present?
    @bikes = @bikes.where(engine_size: params[:filter_engine]) if params[:filter_engine].present?
    @bikes = @bikes.where(price: params[:filter_price]) if params[:filter_price].present?

  #   if params[:filter].present?
  #     @bikes = Bike.where(category: params[:filter])
  #   # elsif params[:filter] == "motorbike"
  #   #   @bikes = Bike.where(category: "motorbike")
  # # elsif params[:squeeze].integer?
  # #    @bikes = Bike.where(price: params[:squeeze])
  #   else
  #     @bikes = Bike.all
  #   end
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
