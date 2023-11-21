class BookingsController < ApplicationController
  before_action :set_booking, only: [:edit, :update, :destroy]
  before_action :set_land, only: [:new, :create]
  def new
    @booking = Booking.new
  end

  def create
    @booking = booking.new(booking_params)
    @booking.land = @land
    if @booking.save
      redirect_to land_path(@land) # TODO: change to dashboard
    else
      render :new, alert: "Booking not created", status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @booking.update(booking_params)
    redirect_to land_path(@booking.land)
  end

  def destroy
    @booking.destroy
    redirect_to land_path(@booking.land), , status: :see_other
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def set_land
    @land = Land.find(params[:land_id])
  end

  def booking_params
    params.require(:booking).permit(:booking_start_date, :booking_end_date, :land_id)
  end
end
