FactoryBot.define do
  factory :favorite, class: Favorite do
    sequence(:user_id) { |n| n}
    sequence(:recipe_id) { |n| n}
    sequence(:title) { |n| "recipe #{n}"}
  end
end
