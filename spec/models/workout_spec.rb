require 'rails_helper'

RSpec.describe Workout, type: :model do

  let(:category) { create(:category) }
  let(:valid_workout) { create(:workout) }

  it "successfully creates a workout with valid params" do
    expect{ valid_workout }.to change{ Workout.count }.by(1)
    expect(valid_workout).to be_valid
  end

  it "fails to create a workout with name less than 3 chars" do
    invalid_workout = build(:workout, name: "WK")

    expect{ invalid_workout }.to change{ Workout.count }.by(0)
    expect(invalid_workout).to_not be_valid
    expect(invalid_workout.errors.messages[:name]).to include("is too short (minimum is 3 characters)")
  end

  it "fails to create a workout without a name" do
    invalid_workout = build(:workout, name: nil)

    expect{ invalid_workout }.to change{ Workout.count }.by(0)
    expect(invalid_workout).to_not be_valid
    expect(invalid_workout.errors.messages[:name]).to include("can't be blank")
    expect(invalid_workout.errors.messages[:name]).to include("is too short (minimum is 3 characters)")
  end

  it "fails to create a workout without a level" do
    invalid_workout = build(:workout, level: nil)

    expect{ invalid_workout }.to change{ Workout.count }.by(0)
    expect(invalid_workout).to_not be_valid
    expect(invalid_workout.errors.messages[:level]).to include("can't be blank")
  end

  it "fails to create a workout without a category provided" do
    invalid_workout = build(:workout, category: nil)

    expect{ invalid_workout }.to change{ Workout.count }.by(0)
    expect(invalid_workout).to_not be_valid
    expect(invalid_workout.errors.messages[:category_id]).to include("can't be blank")
  end

end