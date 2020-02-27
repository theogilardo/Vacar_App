class ReviewsController < ApplicationController

  def index
    @reviews = Review.all
  end

  def new
    @request = Request.find(params[:request_id])
    @review = Review.new()
  end

  def create
    @request = Request.find(params[:request_id])
    @review = Review.new(review_params)
    @review.request = @request
    if @review.save
      redirect_to car_path(@car)
    else
      render :new
    end
  end

  private
  def review_params
    params.require(:review).permit(:rating, :text, :request_id)
  end
end

