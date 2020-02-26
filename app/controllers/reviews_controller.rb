
class ReviewsController < ApplicationController

  def index
    @reviews = Review.all
  end

  def new
    @request = Request.find(params[:request_id])
    @review = Review.new(review_params)
  end

  # def show
  #   @review = Review.find(params[:id])
  # end

  # def create

  #   @review = Review.new(review_params)
  #   @review.car = @car
  #   if @review.save
  #     # redirect_to car_review_path(@review)
  #   else
  #     render 'new'
  #   end
  # end

  private
  def review_params
    params.require(:review).permit(:rating, :text)
  end
end

