FactoryBot.define do
  factory :exercise do
    name { "MyString" }
    category { nil }
    description { "MyString" }
  end

  factory(:category) do
    name { Faker::Lorem.words }
    description { Faker::Lorem.sentence }
  end
end