class DashboardController < ApplicationController
  def show
    @car = Car.find(params[:id])
    @review = Review.new
    @request = Request.new
  end

  def new
    @car =Car.new
  end

  def create
    @car = Car.new

  end

  def destroy
  end
end
