class LandsController < ApplicationController
  def index
    @lands = Land.all
    @lands = Land.search_by_planet_name(params[:query]) if params[:query].present?
  end

  def show
    @land = Land.find(params[:id])
    @booking = Booking.new
    @review = Review.new
  end

  def new
    @land = Land.new
  end

  def create
    @land = Land.new(land_params)
    @land.user = current_user
    if @land.save!
      redirect_to land_path(@land)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @land = Land.find(params[:id])
  end

  def update
    @land = Land.find(params[:id])
    @land.update(land_params)
    redirect_to dashboard_path, status: :see_other
  end

  private

  def land_params
    params.require(:land).permit(:area, :address, :local_attractions, :description, :planet_name, :price, photos: [])
  end

end
