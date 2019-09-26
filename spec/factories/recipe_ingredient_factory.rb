FactoryBot.define do
  factory :recipe_ingredient, class: RecipeIngredient do
    recipe
    ingredient
    sequence(:measurement_type) { rand(2) }
    sequence(:measurement) { rand(3) }
    sequence(:quantity) { rand(4) }
    sequence(:ingredient_id) { rand(4) }
    sequence(:recipe_id) { rand(4) }
  end
end
