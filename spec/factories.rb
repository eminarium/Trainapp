FactoryBot.define do
  factory :workout_exercise do
    workout { nil }
    exercise { nil }
    repetitions { 1 }
  end

  factory :workout do
    name { Faker::Lorem.words }
    category { create(:category) }
    level { Workout.levels.keys.sample }
    description { Faker::Lorem.sentence }
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