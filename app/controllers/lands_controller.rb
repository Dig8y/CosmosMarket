class LandsController < ApplicationController
  def index
    @lands = Land.all
  end

  def show
    @land = land.find(params[:id])
  end
end
