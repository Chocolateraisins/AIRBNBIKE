class BookingsController < ApplicationController
  def show
    @booking = Booking.find(params[:id])
    unless @booking.user == current_user || @booking.bike.user == current_user
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
    unless current_user
      redirect_to new_user_session_path
      flash[:notice] = "Log in to book this bike"
    end
    @bike = Bike.find(params[:bike_id])
    @booking = Booking.new
  end

  def edit
    @booking = Booking.find(params[:booking_id])
    @bike = @booking.bike
    if current_user == nil
      redirect_to new_user_session_path
      flash[:notice] = "Log in to book this bike"
    elsif  current_user != @booking.bike.user
      flash[:notice] = "Only the owner of this bike can edit this booking"
    end
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
