class CarsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @locations = Car.all.pluck(:location).uniq
    @cars = Car.all
    @cars = @cars.where(location: params[:location]) if params[:location].present?
    @cars = @cars.where("start_date <= ?", params[:start_date]) if params[:start_date].present?
    @cars = @cars.where("end_date >= ?", params[:end_date]) if params[:end_date].present?
    # @cars = @cars.where("location = ? AND start_date > ?", params[:location], params[:start_date]) if(params[:location].present? && params[:start_date].present?)
    # @cars = @cars.where("location = ? AND end_date < ?", params[:location], params[:end_date] ) if (params[:location].present? && params[:end_date].present?)
    # @cars = @cars.where("location = ? AND start_date > ? AND end_date < ?", params[:location], params[:start_date], params[:end_date]) if (params[:location].present? && params[:start_date].present? && params[:end_date].present?)
  end


    def show
      @car = Car.find(params[:id])
      @reviews = @car.reviews
    end

    def new
      @car = Car.new
    end

    def create
      @car = Car.new(car_params)
      @car.user = current_user
      if @car.save
        redirect_to dashboard_owner_path(@car.user)
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
      redirect_to dashboard_owner_path
    end

    private

    def car_params
      params.require(:car).permit(:brand, :price, :model, :number_of_seats, :registration_number, :transmission, :airconditioning, :year, :photo, :start_date, :end_date, :location)
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
