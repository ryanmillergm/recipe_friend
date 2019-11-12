class Step < ApplicationRecord
  validates_presence_of :step, presence: true, length: { minimum: 5 }
  validates_presence_of :recipe_id

  belongs_to :recipe
end
