class DashboardsController < ApplicationController
    before_action :authenticate_user!

def index
  Car.all
end

def owner
  # binding.pry
  @user = current_user
  @cars = Car.where(user_id: @user.id)
  @requests = Request.where(user_id: @user.id)
  # @reviews = @user.request.review

end

def user
  @user = current_user
  @requests = Request.where(user_id: @user.id)
end

end
