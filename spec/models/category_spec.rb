require 'rails_helper'

RSpec.describe Category, type: :model do
  it "creates a category with valid params" do
    category = Category.create(
      name: "Back",
      description: "Workouts/exercises for back only"
    )

    expect(category.name).to eq("Back")
    expect(Category.count).to eq(1)
  end

  it "creates a category with only name provided" do
    category = Category.create(
      name: "ABC"
    )

    expect(category.name).to eq("ABC")
    expect(Category.count).to eq(1)
  end

  it "fails to create a category without its name provided" do
    category = Category.create(
      description: "Just a test description"
    )

    expect(category.errors.messages[:name]).to include("can't be blank")
    expect(category.errors.messages[:name]).to include("is too short (minimum is 3 characters)")
    expect(Category.count).to eq(0)
  end

  it "fails to create a category if its name is less than 3 characters" do
    category = Category.create(
      name: "AB",
      description: "A test description"
    )
    
    expect(category.errors.messages[:name]).to eq(['is too short (minimum is 3 characters)'])
    expect(Category.count).to eq(0)
  end
end