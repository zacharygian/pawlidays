class BookingsController < ApplicationController
  # before_action :find_booking,

  def index
    @bookings = Booking.All
  end

  def dashboard
    @bookings = current_user.bookings
    authorize @bookings
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
  end

  def destroy
  end

  private

  def find_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:date, :time)
  end
end
