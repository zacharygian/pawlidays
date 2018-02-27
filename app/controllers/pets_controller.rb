class PetsController < ApplicationController
  before_action :find_pet, only: [:show]

  def index
    @pets = policy_scope(Pet)
  end

  def show
  end

  def destroy
    @pet = Pet.find(params[:id])
    @pet.destroy
    redirect_to pet_path(@pets)
  end

  private

  def find_pet
    @pet = Pet.find(params[:id])
  end

  def pet_params
    params.require(:pet).permit(:name, :animal_type, :user_id)
  end
end
