class PagesController < ApplicationController
  def home
    @lands = Land.all.take(3)
  end
end
