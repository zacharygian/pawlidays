class BookingsController < ApplicationController
  before_action :find_pet, only: [:dashboard, :new, :create]

  def dashboard
    @bookings = current_user.bookings
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.pet = @pet
    redirect_to dashboard_path
  end

  def destroy
  end

  private

  def find_pet
    @pet = Pet.find(params[:pet_id])
  end

  def booking_params
    params.require(:booking).permit(:date, :time, :user_id, :pet_id)
  end
end
