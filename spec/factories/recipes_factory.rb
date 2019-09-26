FactoryBot.define do
  factory :recipe do
    sequence(:title) { |n| "spaghetti #{n}" }
    sequence(:description) { |n| "This is a recipe for spaghetti #{n}" }
    sequence(:type) { rand(3) }
    sequence(:user_id) { rand(4) }
  end
end
