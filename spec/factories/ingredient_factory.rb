FactoryBot.define do
  factory :ingredient, class: Ingredient do
    sequence(:name) { |n| "marinara sauce #{n}" }
    sequence(:ingredient_type) { 0 }
  end
end
