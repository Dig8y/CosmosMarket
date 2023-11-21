class UsersController < ApplicationController

  def dashboard
    @user = current_user
    @bookings = current_user.bookings
    @lands = current_user.lands
  end
end
