class AddFieldsToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :type, :string
    add_column :users, :name, :string
    add_column :users, :phone_number, :string
    add_column :users, :address, :string
    add_column :users, :animal_type, :string
    add_column :users, :animal_size, :string
    add_column :users, :onsite, :boolean
  end
end
