require 'rails_helper'

RSpec.describe Category, type: :model do

  let(:valid_category) { create(:category) }

  it "creates a category with valid params" do
    expect{valid_category}.to change {Category.count}.by(1)
  end

  it "creates a category with only name provided" do
    category = create(:category, description: nil)

    expect(category).to be_valid
  end

  it "fails to create a category without its name provided" do
    invalid_category = build(:category, name: nil)

    expect{ invalid_category.save }.to change { Category.count }.by(0)
    expect(invalid_category).to_not be_valid

    expect(invalid_category.errors.messages[:name]).to include("can't be blank")
    expect(invalid_category.errors.messages[:name]).to include("is too short (minimum is 3 characters)")

  end

  it "fails to create a category if its name is less than 3 characters" do
    invalid_category = build(:category, name: "AB")

    expect{ invalid_category.save }.to change{ Category.count }.by(0)
    expect(invalid_category.errors.messages[:name]).to eq(['is too short (minimum is 3 characters)'])
  end
end