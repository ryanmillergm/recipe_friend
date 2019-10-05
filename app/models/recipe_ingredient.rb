class RecipeIngredient < ApplicationRecord
  enum measurement_type: [:volume, :weight, :by_each]
  enum measurement: [:ounce, :cup, :pint, :quart, :gallon]

  validates_presence_of :measurement_type
  validates_presence_of :measurement
  validates_presence_of :quantity
  validates_presence_of :recipe_id
  validates_presence_of :ingredient_id

  belongs_to :recipe
  belongs_to :ingredient
end
