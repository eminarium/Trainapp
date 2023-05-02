require 'rails_helper'

RSpec.describe Workout, type: :model do

  let(:category) { create(:category) }

  it "successfully creates a workout" do
    # workout = Workout.create(name: "Workout-1", level: "easy", category: category)
    workout = create(:workout)

    expect(workout).to be_valid
    expect(Workout.count).to eq(1)
  end

  it "fails to create a workout with name less than 3 chars" do
    workout = Workout.create(name: "WK", level: "easy", category: category)

    expect(workout).to_not be_valid
    expect(Workout.count).to eq(0)
    expect(workout.errors.messages[:name]).to include("is too short (minimum is 3 characters)")
  end

  it "fails to create a workout without a name" do
    workout = Workout.create(level: "easy", category: category)

    expect(workout).to_not be_valid
    expect(Workout.count).to eq(0)
    expect(workout.errors.messages[:name]).to include("can't be blank")
    expect(workout.errors.messages[:name]).to include("is too short (minimum is 3 characters)")
  end

  it "fails to create a workout without a level" do
    workout = Workout.create(name: "Workout-1", category: category)

    expect(workout).to_not be_valid
    expect(Workout.count).to eq(0)
    expect(workout.errors.messages[:level]).to include("can't be blank")
  end

  it "fails to create a workout without a category provided" do
    workout = Workout.create(name: "Workout-1", level: "easy")

    expect(workout).to_not be_valid
    expect(Workout.count).to eq(0)
    expect(workout.errors.messages[:category_id]).to include("can't be blank")
  end

end