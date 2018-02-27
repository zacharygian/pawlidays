class UsersController < ApplicationController
  before_action :set_user, only: [ :show ]

  def index
    @users = User.All
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:type, :name, :phone_number, :address, :animal_type, :animal_size, :onsite)
  end
end
