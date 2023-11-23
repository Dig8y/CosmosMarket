class ReviewsController < ApplicationController
  def create
    @land = Land.find(params[:land_id])
    @review = Review.new(review_params)
    @review.land = @land
    if @review.save
      redirect_to land_path(@review.land)
    else
      render 'lands/show', status: :unprocessable_entity
    end
  end

  private

  def review_params
    params.require(:review).permit(:comment, :rating)
  end
end
