class Workout < ApplicationRecord

  enum level: { easy: 0, medium: 1, hard: 2 }

  # VALIDATIONS
  validates :name, presence: true, length: { minimum: 3 }
  validates :level, presence: true#, inclusion: { in: [0..2], message: "%{value} is not a valid value" }
  validates :category_id, presence: true

  # ASSOCIATIONS
  belongs_to :category

  has_many :workout_exercises
  has_many :exercises, through: :workout_exercises
end
