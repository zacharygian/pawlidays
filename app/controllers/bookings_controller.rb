class BookingsController < ApplicationController
  before_action :find_pet, only: [:create]

  def dashboard
    @bookings = current_user.bookings
    authorize @bookings
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.pet = @pet
    @booking.user = current_user
    @booking.save
    authorize @booking
    redirect_to dashboard_path

  end

  def destroy
  end

  private

  def find_pet
    @pet = Pet.find(params[:pet_id])
  end

  def find_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    user_id = current_user.id
    params.require(:booking).permit(:date, :time, :user_id, :pet_id)
  end
end
