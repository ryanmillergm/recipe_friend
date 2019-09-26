FactoryBot.define do
  factory :recipe_ingredient do
    sequence(:measurement_type) { rand(3) }
    sequence(:description) { |n| "This is a recipe for spaghetti #{n}" }
    sequence(:type) { rand(2) }
    sequence(:user_id) { |n| n }
  end
end
