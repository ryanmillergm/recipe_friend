FactoryBot.define do
  factory :recipe do
    sequence(:step) {  |n| "Step #{n}. Start a pot of water and bring to a boil." }
    sequence(:user_id) { rand(4) }
  end
end
