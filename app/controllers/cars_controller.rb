class CarsController < ApplicationController
  before_action :set_car, only: %i[show edit update destroy]

  def index
    @cars = Car.all
  end

  def show
  end

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
    @user = current_user.id
    @car.user_id = @user
    @car.save
    redirect_to car_path(@car)
  end

  def edit
  end

  def update
    @car.update(car_params)
    redirect_to car_path(@car)
  end

  def destroy
    @car.destroy
    redirect_to cars_path
  end

  def my_cars
    @cars = Car.where(user_id: current_user)
  end
  private

  def car_params
    params.require(:car).permit(:year, :brand, :category, :model, :city, :price, :description)
  end

  def set_car
    @car = Car.find(params[:id])
  end
end
