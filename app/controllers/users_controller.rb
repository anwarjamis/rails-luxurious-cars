class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update]

  def show
    @user = User.find(params[:id])
    authorize @user
  end

  def new
    @user = User.new
    authorize @user
  end

  def create
    @user = User.new(user_params)
    authorize @user
  end

  def edit
    authorize @user
  end

  def update
    @user.update(user_params)
    authorize @user
  end

  private

  def user_params
    params.require(:car).permit(:year, :brand, :category, :model, :city, :price, :description)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
