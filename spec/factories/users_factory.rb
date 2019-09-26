FactoryBot.define do
  factory :user do
    sequence(:first_name) { |n| "john#{n}" }
    sequence(:last_name) { |n| "doe#{n}" }
    sequence(:username) { |n| "john_doe#{n}" }
    sequence(:password) { "password" }
    sequence(:email) { |n| "user-#{n}@example.com" }
    sequence(:role) { 0 }
    sequence(:avatar) { "avatar" }
    sequence(:about) { "about" }
    sequence(:telephone) { |n| n }
  end
end
