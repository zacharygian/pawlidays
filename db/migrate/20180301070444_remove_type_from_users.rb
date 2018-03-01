class RemoveTypeFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :type
    add_column :users, :is_sitter, :boolean
  end
end
