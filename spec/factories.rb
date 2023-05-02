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
    name { Faker::Lorem.words }
    category { create(:category) }
    description { Faker::Lorem.sentence }
  end

  factory(:category) do
    name { Faker::Lorem.word }
    description { Faker::Lorem.sentence }
  end
end