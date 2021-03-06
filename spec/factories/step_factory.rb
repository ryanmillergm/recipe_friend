FactoryBot.define do
  factory :step, class: Step do
    user
    sequence(:step) {  |n| "Step #{n}. Start a pot of water and bring to a boil." }
    sequence(:user_id) { rand(4) }
  end
end
