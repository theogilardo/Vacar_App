class RequestsController < ApplicationController
  before_action :set_car, only: [:create, :new]

  def index
  @requests = Request.all
  end

  def show
    @request = Request.find(params[:id])
    @car = @request.car
  end

  def new
    @request = Request.new
  end

  def create
    @request = Request.new(request_params)
    @request.car = @car
    @request.user = current_user
    if @request.save
      redirect_to dashboard_user_path
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

  def destroy
    @request = Request.find(params[:id])
    @request.destroy
    redirect_back(fallback_location: root_path)
  end

  private

   def set_car
    @car = Car.find(params[:car_id])
  end

  def request_params
    params.require(:request).permit(:drop_off_date, :pick_up_date)
  end

end
