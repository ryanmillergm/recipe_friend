class Ingredient < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :ingredient_type

  has_many :recipe_ingredients
  has_many :recipes, through: :recipe_ingredients
end