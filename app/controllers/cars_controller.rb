class CarsController < ApplicationController
  before_action :set_car, only: %i[show edit update destroy]
  skip_before_action :authenticate_user!, only: :index

  def index
    @cars = policy_scope(Car).order(created_at: :desc)
    if params[:query].present?
      @cars = Car.search_by_brand_and_model(params[:query])
    else
      @cars
    end
  end

  def show
    authorize @car
  end

  def new
    @car = Car.new
    authorize @car
  end

  def create
    @car = Car.new(car_params)
    authorize @car
    @user = current_user.id
    @car.user_id = @user
    @car.save
    redirect_to car_path(@car)
  end

  def edit
    authorize @car
  end

  def update
    @car.update(car_params)
    authorize @car
    redirect_to car_path(@car)
  end

  def destroy
    @car.destroy
    authorize @car
    redirect_to cars_path
  end

  def my_cars
    @cars = Car.where(user_id: current_user)
    authorize @cars
  end

  private

  def car_params
    params.require(:car).permit(:year, :brand, :category, :model, :city, :price, :description)
  end

  def set_car
    @car = Car.find(params[:id])
  end
end
