class Ingredient < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :type

  has_many :recipes, through: :recipe_ingredients
  has_many :recipe_ingredients
end
