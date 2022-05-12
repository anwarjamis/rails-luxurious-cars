class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update]

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
  end

  def edit
  end

  def update
    @user.update(user_params)
  end

  private

  def user_params
    params.require(:car).permit(:year, :brand, :category, :model, :city, :price, :description)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
