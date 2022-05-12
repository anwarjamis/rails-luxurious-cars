class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:show, :edit, :update, :destroy]
  before_action :set_car, only: [:show, :new, :create, :edit, :update]

  def index
    @reservations = policy_scope(Reservation).order(created_at: :desc)
    @reservations_of_user = @reservations.where(user_id: current_user)
  end

  def show
    authorize @reservation
  end

  def new
    @reservation = Reservation.new
    authorize @reservation
  end

  def create
    @reservation = Reservation.new(reservation_params)
    authorize @reservation
    @reservation.user_id = current_user.id
    @reservation.car_id = params[:car_id]
    @reservation.amount = (@reservation.end_date.day - @reservation.start_date.day) * @car.price
    @reservation.save
    redirect_to car_reservation_path(@car, @reservation)
  end

  def edit
    authorize @reservation
  end

  def update
    @reservation.update(reservation_params)
    authorize @reservation
    redirect_to car_reservation_path(@car, @reservation)
  end

  def destroy
    @reservation.destroy
    authorize @reservation
    redirect_to root_path
  end

  private

  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date)
  end

  def set_reservation
    @reservation = Reservation.find(params[:id])
  end

  def set_car
    @car = Car.find(params[:car_id])
  end
end
