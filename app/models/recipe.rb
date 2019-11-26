class Recipe < ApplicationRecord
  attr_accessor :crop_x,
                :crop_y,
                :crop_w,
                :crop_h

  validates_presence_of :title
  validates_presence_of :description, presence: true, length: { minimum: 5 }
  validates_presence_of :recipe_type
  validates_presence_of :user_id
  validate :image_size

  has_many :recipe_ingredients, dependent: :destroy
  has_many :ingredients, through: :recipe_ingredients
  has_many :steps
  has_many :comments, as: :commentable
  has_one_attached :image

  def image_size
    if self.image.attached?
      image.blob.analyze
      errors.add :image, 'too big!' if image.blob.metadata[:width] > 4096
      errors.add :image, 'too small!' if image.blob.metadata[:width] < 200 || image.blob.metadata[:height] < 200
    end
  end

  def self.get_recipes(search_params)
    Recipe.where("title LIKE ?", "%#{search_params[:q].downcase.titleize}%").includes(:recipe_ingredients, :ingredients)
  end

  def self.my_recipes(id)
    Recipe.where(user_id: id)
  end

  def small_thumbnail
    return self.image.variant(resize: '150x150').processed
  end

  def cropped_image
    return self.image.variant(crop: self.image_coords ).processed
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
