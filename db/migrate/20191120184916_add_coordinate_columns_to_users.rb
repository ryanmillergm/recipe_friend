class AddCoordinateColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :avatar_coords, :string
    add_column :users, :background_coords, :string
  end
end
