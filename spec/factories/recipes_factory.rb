FactoryBot.define do
  factory :recipe do
    sequence(:title) { |n| "spaghetti #{n}" }
    sequence(:description) { |n| "This is a recipe for spaghetti #{n}" }
    sequence(:type) { 0 }
    sequence(:user_id) { |n| n }
  end
end
