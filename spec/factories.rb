FactoryBot.define do
  factory :workout_exercise do
    workout { nil }
    exercise { nil }
    repetitions { 1 }
  end

  factory :workout do
    name { "MyString" }
    category { nil }
    level { 1 }
    description { "MyText" }
  end

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