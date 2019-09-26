FactoryBot.define do
  factory :ingredient do
    sequence(:name) { |n| "spaghetti #{n}" }
    sequence(:type) { 0 }
  end
end
