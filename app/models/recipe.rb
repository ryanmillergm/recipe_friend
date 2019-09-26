class Recipe < ApplicationRecord
  validates_presence_of :title
  validates_presence_of :description
  validates_presence_of :type
  validates_presence_of :user_id

  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
  has_many :steps
end
