class Recipe < ApplicationRecord
  validates_presence_of :title
  validates_presence_of :description
  validates_presence_of :recipe_type
  validates_presence_of :user_id

  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
  has_many :steps

  def self.get_recipe_results(search_params)
    Recipe.where("title LIKE ?", "%#{search_params[:q]}%")
  end
end
