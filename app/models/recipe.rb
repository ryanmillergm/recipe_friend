class Recipe < ApplicationRecord
  validates_presence_of :title
  validates_presence_of :description
  validates_presence_of :recipe_type
  validates_presence_of :user_id

  has_many :recipe_ingredients, dependent: :destroy
  has_many :ingredients, through: :recipe_ingredients
  has_many :steps
  has_many :comments, as: :commentable
  has_one_attached :image

  def self.get_recipes(search_params)
    Recipe.where("title LIKE ?", "%#{search_params[:q].downcase.titleize}%").includes(:recipe_ingredients, :ingredients)
  end

  def self.my_recipes(id)
    Recipe.where(user_id: id)
  end

  def small_thumbnail
    return self.image.variant(resize: '150x150').processed
  end

  def thumbnail
    return self.image.variant(resize: '300x300').processed
  end

  def show_image
    return self.image.variant(resize: '500x500').processed
  end

  def get_recipe(id)
    Recipe.find(id)
  end
end
