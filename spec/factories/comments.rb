FactoryBot.define do
  factory :comment do
    content { "MyString" }
    commentable_id { 1 }
    commentable_type { "MyString" }
  end
end
