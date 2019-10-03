class Recipe < ApplicationRecord
  validates_presence_of :title
  validates_presence_of :description
  validates_presence_of :recipe_type
  validates_presence_of :user_id

  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
  has_many :steps

  def self.get_recipe_results(search_params)
    recipe = search_params[:q].downcase.titleize
    Recipe.where("title LIKE ?", "%#{recipe}%").includes(:recipe_ingredients, :ingredients)
  end
end
