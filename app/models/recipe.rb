class Recipe < ApplicationRecord
  validates_presence_of :title
  validates_presence_of :description
  validates_presence_of :recipe_type
  validates_presence_of :user_id

  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
  has_many :steps
  has_one_attached :image

  def self.get_recipes(search_params)
    Recipe.where("title LIKE ?", "%#{search_params[:q].downcase.titleize}%").includes(:recipe_ingredients, :ingredients)
  end
end
