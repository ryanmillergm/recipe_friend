class Favorite < ApplicationRecord
  validates_presence_of :title
  validates_presence_of :user_id
  validates_presence_of :recipe_id

  belongs_to :user
  belongs_to :recipe
end
