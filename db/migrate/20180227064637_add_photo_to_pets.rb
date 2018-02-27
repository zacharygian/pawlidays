class AddPhotoToPets < ActiveRecord::Migration[5.1]
  def change
    add_column :pets, :photo, :string
  end
end
