require 'rails_helper'

RSpec.describe Exercise, type: :model do
  
  let(:category) { create(:category) }

  it "creates an exercise with valid params" do
    exercise = Exercise.create(name: "An exercise", category: category)

    expect(exercise).to be_valid
  end

  it "fails to create an exercise without a name provided" do
    exercise = Exercise.create(name: nil, category: category)

    expect(exercise).not_to be_valid
    expect(exercise.errors.messages[:name]).to include("can't be blank")
    expect(exercise.errors.messages[:name]).to include("is too short (minimum is 3 characters)")
  end

  it "fails to create an exercise with a name less than 3 characters" do
    exercise = Exercise.create(name: "ab", category: category)

    expect(exercise).not_to be_valid
    expect(exercise.errors.messages[:name]).to include("is too short (minimum is 3 characters)")
  end

  it "fails to create an exercise without a category" do
    exercise = Exercise.create(name: "Test exercise", category: nil)

    expect(exercise).not_to be_valid
    expect(exercise.errors.messages[:category_id]).to include("can't be blank")
  end
end