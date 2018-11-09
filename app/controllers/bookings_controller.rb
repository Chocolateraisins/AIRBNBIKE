class BookingsController < ApplicationController
  def show
    @booking = Booking.find(params[:id])
    unless @booking.user == current_user
      redirect_to root_path
      flash[:notice] = "Log in to view your bookings"
    end
  end

  def index
    @user = current_user
    if @user == nil
      redirect_to root_path
      flash[:notice] = "Log in to view your bookings"
    else
      @bookings = @user.bookings
    end
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
    @booking.status = "pending"
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
