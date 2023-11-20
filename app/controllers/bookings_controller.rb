class BookingsController < ApplicationController
  def index
    @booking = Booking.new
  end
end
