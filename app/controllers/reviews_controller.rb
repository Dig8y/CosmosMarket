class ReviewsController < ApplicationController
  def create
    @land = Land.find(params[:land_id])
    @review = Review.new(review_params)
    @review.land = @land
    if @review.save
      redirect_to land_path(@review.land)
    else
      redirect_to land_path(@review.land), :notice => "Please add a star"
    end
  end

  private

  def review_params
    params.require(:review).permit(:comment, :rating)
  end
end
