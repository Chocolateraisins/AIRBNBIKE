class BikesController < ApplicationController

  def show
    @bike = Bike.find(params[:id])
    @images = @bike.images.all
  end

  def index
    if params[:filter].present?
      @bikes = Bike.where(category: params[:filter])
    # elsif params[:filter] == "motorbike"
    #   @bikes = Bike.where(category: "motorbike")
  # elsif params[:squeeze].integer?
  #    @bikes = Bike.where(price: params[:squeeze])
    else
      @bikes = Bike.all
    end
  end


  def new
    @bike = Bike.new
    # @image = @bike.images
  end

  def create
    @bike = Bike.new(bike_params)
    @bike.user = current_user
    if @bike.save
      redirect_to bike_path(@bike)
    else
      render :new
    end

  # respond_to do |format|
  #    if @bike.save
  #      params[:images]['avatar'].each do |a|
  #         @image = @bike.images.create!(:avatar => a)
  #      end
  #      format.html { redirect_to @bike, notice: 'Bike was successfully created.' }
  #    else
  #      format.html { render action: 'new' }
  #    end
  #  end



  end





  def edit
  end

  private

  def bike_params
    params.require(:bike).permit(:category, :price, :brand, :engine_size, :image, :remove_image, :image_cache, :remote_image_url, attachments: [])

  end
end
