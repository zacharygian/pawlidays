class PetsController < ApplicationController
  before_action :find_pet, only: [:show]

  def index
    @pets = policy_scope(Pet)
    @users = User.where.not(latitude: nil, longitude: nil)
    @markers = @users.map do |flat|
      {
        lat: user.latitude,
        lng: user.longitude#,
        # infoWindow: { content: render_to_string(partial: "/flats/map_box", locals: { flat: flat }) }
      }
    end
  end

  def dashboard
    @pets = current_user.pets
    authorize @pets
  end

  def show
    @booking = Booking.new
    authorize @pet
  end

  def new
    @pet = Pet.new
    authorize @pet
  end

  def create
    @pet = Pet.new(pet_params)
    @pet.user = current_user
    @pet.availability << params[:pet][:availability]
    authorize @pet
    if @pet.save
      redirect_to owner_path
    else
      render :new
    end
  end

  def destroy
    @pet = Pet.find(params[:id])
    @pet.destroy
    authorize @pet
    redirect_to dashboard_path
  end

  private

  def find_pet
    @pet = Pet.find(params[:id])
  end

  def pet_params
    params.require(:pet).permit(:name, :animal_type, :user_id, :photo, :availability)
  end
end
