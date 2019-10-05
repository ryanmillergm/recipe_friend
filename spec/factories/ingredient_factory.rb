FactoryBot.define do
  factory :ingredient, class: Ingredient do
    sequence(:name) { |n| "Marinara Sauce #{n}" }
    sequence(:ingredient_type) { 0 }
  end
end
