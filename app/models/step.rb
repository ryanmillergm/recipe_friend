class Step < ApplicationRecord
  validates_presence_of :step
  validates_presence_of :recipe_id

  belongs_to :recipe
end
