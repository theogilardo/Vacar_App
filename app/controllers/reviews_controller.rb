# class ReviewsController < ApplicationController

#   def index
#   @reviews = Review.all
#   end

#   def show
#     @review = Review.find(params[:id])
#   end

#   def new
#     @review = Review.new
#   end

#   def create
#     @review = Review.new(review_params)
#     @review.user = current_user
#     if @review.save
#       redirect_to reviews_path
#     else
#       render :new
#     end
#   end

#   def edit
#     @review = Review.find(params[:id])
#   end

#   def update
#     @review = Review.find(params[:id])
#     @review.update(review_params)
#     @review.save
#     redirect_to review_path(@review)
#   end

#   def destroy
#     @review = Review.find(params[:id])
#     @review.destroy
#     redirect_to reviews_path
#   end

#   private

#   def review_params
#     params.require(:review).permit(:rating, :text)
#   end
# end
