class RecipeIngredient < ApplicationRecord
  validates_presence_of :measurement_type
  validates_presence_of :measurement
  validates_presence_of :quantity
  validates_presence_of :recipe_id
  validates_presence_of :ingredient_id

  belongs_to :recipe
  belongs_to :ingredient
end
