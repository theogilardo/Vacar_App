class RequestsController < ApplicationController

  def index
  @requests = Request.all
  end

  def show
    @request = Request.find(params[:id])
  end

  def new
    @car = Car.find(params[:car_id])
    @request = Request.new

  end

  def create
    @car = Car.find(params[:car_id])
    @request = Request.new(request_params)
    @request.car = @car
    @request.user = current_user
    if @request.save
      redirect_to car_requests_path
    else
      render :new
    end
  end

  # def edit
  #   @request = Request.find(params[:id])
  # end

  # def update
  #   @request = Request.find(params[:id])
  #   @request.update(request_params)
  #   @request.save
  #   redirect_to request_path(@request)
  # end

  # def destroy
  #   @request = Request.find(params[:id])
  #   @request.destroy
  #   redirect_to requests_path
  # end

  private

  def request_params
    params.require(:request).permit(:drop_off_date, :pick_up_date)
  end

end
