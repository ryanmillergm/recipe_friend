class Ingredient < ApplicationRecord
  enum ingredient_type: [ :herb, :fruit, :liquid, :protein, :spice, :vegetable ]

  validates_presence_of :name
  validates_presence_of :ingredient_type

  has_many :recipe_ingredients, dependent: :destroy
  has_many :recipes, through: :recipe_ingredients
end
