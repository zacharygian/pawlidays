class BookingsController < ApplicationController
  before_action :find_booking,

  def index
    @bookings = Booking.All
  end

  def show
    @user = current_user
    @booking = Booking.find(params[:id])
    # pets/1/bookings/5
    # pets/:id_id/bookings/:id
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

  def find_user_pet?
  end

  def booking_params
  end
end
