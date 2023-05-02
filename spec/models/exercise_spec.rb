require 'rails_helper'

RSpec.describe Exercise, type: :model do
  
  let(:category) { create(:category) }
  let(:valid_exercise) { create(:exercise) }

  it "creates an exercise with valid params" do
    expect{ valid_exercise }.to change{ Exercise.count }.by(1)
    expect(valid_exercise).to be_valid
  end

  it "fails to create an exercise without a name provided" do
    invalid_exercise = build(:exercise, name: nil)

    expect(invalid_exercise).not_to be_valid
    expect(invalid_exercise.errors.messages[:name]).to include("can't be blank")
    expect(invalid_exercise.errors.messages[:name]).to include("is too short (minimum is 3 characters)")
  end

  it "fails to create an exercise with a name less than 3 characters" do
    invalid_exercise = build(:exercise, name: "ab")

    expect(invalid_exercise).not_to be_valid
    expect(invalid_exercise.errors.messages[:name]).to include("is too short (minimum is 3 characters)")
  end

  it "fails to create an exercise without a category" do
    invalid_exercise = build(:exercise, category: nil)

    expect(invalid_exercise).not_to be_valid
    expect(invalid_exercise.errors.messages[:category_id]).to include("can't be blank")
  end
end