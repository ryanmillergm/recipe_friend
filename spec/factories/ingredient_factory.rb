FactoryBot.define do
  factory :ingredient, class: Ingredient do
    sequence(:name) { |n| "spaghetti #{n}" }
    sequence(:ingredient_type) { 0 }
  end
end
