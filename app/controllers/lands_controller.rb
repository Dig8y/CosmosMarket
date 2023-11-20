class LandsController < ApplicationController
  def index
    @lands = Land.all
  end

  def show
    @land = Land.find(params[:id])
  end
end
