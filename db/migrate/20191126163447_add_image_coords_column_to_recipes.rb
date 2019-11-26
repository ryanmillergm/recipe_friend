class AddImageCoordsColumnToRecipes < ActiveRecord::Migration[5.2]
  def change
    add_column :recipes, :image_coords, :string
  end
end
