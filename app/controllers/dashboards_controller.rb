class DashboardsController < ApplicationController

def show
  @car = Car.find(params[:id])
  @request = Request.new
  @review = Review.new
end

def new
  @car = Car.new
  @re
end



end
