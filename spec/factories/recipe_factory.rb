FactoryBot.define do
  factory :recipe, class: Recipe do
    user
    sequence(:title) { |n| "Spaghetti #{n}" }
    sequence(:description) { |n| "This is a recipe for spaghetti #{n}" }
    sequence(:recipe_type) { rand(3) }
    sequence(:user_id) { rand(4) }
    sequence(:image_coords) { "1200x1200+0+0" }
  end
end
