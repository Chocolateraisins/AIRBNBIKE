class BikesController < ApplicationController

  def show
  end

  def index
    @bikes = Bike.all
  end

  def new
    @user = User.find(params[:user_id])
    @bike = Bike.new
  end

  def create
    @bike = Bike.new(review_params)
    @bike.user = User.find(params[:user_id])
    if @bike.save
      redirect_to restaurant_path(@bike.user)
    else
      render :new
    end
  end


  def edit
  end

  private

  def bike_params
    params.require(:bike).permit(:category, :price, :brand, :engine_size, :user_id)
  end
end
