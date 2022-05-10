class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:show, :edit, :update, :destroy]
  before_action :set_car

  def index
    @reservations = Reservation.all
  end

  def show
  end

  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @user = current_user.id
    @reservation.user_id = @user
    @reservation.car_id = params[:car_id]
    @reservation.save
    redirect_to reservation_path(@reservation)
  end

  def edit
  end

  def update
    @reservation.update(reservation_params)
    redirect_to reservation_path(@reservation)
  end

  def destroy
    @reservation.destroy
    redirect_to reservations_path
  end

  private

  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date, :amount)
  end

  def set_reservation
    @reservation = Reservation.find(params[:id])
  end

  def set_car
    @car = Car.find([params[:car_id]])
  end
end
