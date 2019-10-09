class AddTitleToFavorites < ActiveRecord::Migration[5.2]
  def change
    add_column :favorites, :title, :string
  end
end
