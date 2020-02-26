class CarsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
  @cars = Car.all
  end

  def show
    @car = Car.find(params[:id])
    @review = Review.new

  end

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
    @car.user = current_user
    if @car.save
      redirect_to car_path(@car)
    else
      render :new
    end
  end

  def edit
    @car = Car.find(params[:id])
    authorize_owner!(@car)
  end

  def update
    @car = Car.find(params[:id])
    authorize_owner!(@car)

    @car.update(car_params)
    @car.save
    redirect_to car_path(@car)
  end

  def destroy
    @car = Car.find(params[:id])
    authorize_owner!(@car)
    @car.destroy
    redirect_to cars_path
  end

  private

  def car_params
    params.require(:car).permit(:brand, :price, :model, :number_of_seats, :registration_number, :transmission, :airconditioning, :year, :photo)
  end

  def authorize_owner!(car)
    if current_user != car.user
      flash[:notice] = "Bad user."
      redirect_to cars_path
    end
  end
end

# No user_id in the params YET !!
# No AVAILABILITY for Cars in the params YET !!
