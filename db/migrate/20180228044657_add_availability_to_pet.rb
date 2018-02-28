class AddAvailabilityToPet < ActiveRecord::Migration[5.1]
  def change
    add_column :pets, :availability, :string, array: true, default: []
  end
end
