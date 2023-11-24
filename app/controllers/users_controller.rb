class UsersController < ApplicationController

  def dashboard
    @user = current_user
    @bookings = current_user.bookings
    @lands = current_user.lands
    @land = Land.new
  end
end
