class DashboardsController < ApplicationController
    before_action :authenticate_user!

def owner
  # binding.pry
  @user = current_user
  @cars = Car.where(user_id: @user.id)
  @my_cars_requests = Request.where(car_id: @cars)
  # @reviews = @user.request.review

end

def user
  @user = current_user
  @requests = Request.where(user_id: @user.id)
end

end
