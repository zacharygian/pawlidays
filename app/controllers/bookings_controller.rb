class BookingsController < ApplicationController


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
    params.require(:booking).permit(:date, :time, :user_id, :pet_id)
  end
end
