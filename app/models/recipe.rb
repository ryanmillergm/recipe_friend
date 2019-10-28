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

  def self.my_recipes(id)
    Recipe.where(user_id: id)
  end

  def thumbnail
    return self.image.variant(resize: '200x200').processed
  end

  def show_image
    return self.image.variant(resize: '500x500').processed
  end
end
