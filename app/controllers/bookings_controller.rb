class BookingsController < ApplicationController
  def show
    # if @booking.user == current_user
      @booking = Booking.find(params[:id])
    # else
    #   redirect_to bikes_path
    #   flash[:notice] = "Go F yourself :)"
    # end
  end

  def index
    @user = current_user
    @bookings = @user.bookings
  end

  def new
    @bike = Bike.find(params[:bike_id])
    @booking = Booking.new
  end

  def create
    @bike = Bike.find(params[:bike_id])
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.bike = @bike
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new
    end
  end


  def edit
  end

  def update
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :delivery_address)
  end
end
