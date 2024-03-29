FactoryBot.define do
  factory :user, class: User do
    sequence(:first_name) { |n| "john#{n}" }
    sequence(:last_name) { |n| "doe#{n}" }
    sequence(:username) { |n| "john_doe#{n}" }
    sequence(:password) { "password" }
    sequence(:email) { |n| "user-#{n}@example.com" }
    sequence(:role) { rand(2) }
    sequence(:about) { "about" }
    sequence(:telephone) { |n| n }
    sequence(:location) { "location" }
    sequence(:quote) { "quote" }
  end
end
