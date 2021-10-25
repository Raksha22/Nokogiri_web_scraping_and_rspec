FactoryBot.define do
  factory :subject do
    title { "MyString" }
  end
  factory :student do
    name { 'test student' }
    email { 'test@gmail.com' }
    trait :invalid do
      name { nil }
    end
  end
end