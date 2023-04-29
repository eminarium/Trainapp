class Category < ApplicationRecord
  
  # VALIDATIONS
  validates :name, presence: true, length: { minimum: 3 }

  # ASSOCIATIONS
  has_many :exercises
  has_many :workouts
end
