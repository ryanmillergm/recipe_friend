class CreateRecipeIngredients < ActiveRecord::Migration[5.2]
  def change
    create_table :recipe_ingredients do |t|
      t.integer :measurement_type
      t.integer :measurement
      t.decimal :quantity
      t.references :ingredient, foreign_key: true

      t.timestamps
    end
  end
end
