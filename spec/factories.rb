FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    password_confirmation { password }
  end

  factory :workout_exercise do
    workout { create(:workout) }
    exercise { create(:exercise, workout: workout) }
    repetitions { 3 }
  end

  factory :workout do
    name { Faker::Lorem.words.join(" ") }
    category { create(:category) }
    level { Workout.levels.keys.sample }
    description { Faker::Lorem.sentence }
  end

  factory :exercise do
    name { Faker::Lorem.words.join(" ") }
    category { create(:category) }
    description { Faker::Lorem.sentence }
  end

  factory(:category) do
    name { Faker::Lorem.words.join(" ") }
    description { Faker::Lorem.sentence }
  end
end