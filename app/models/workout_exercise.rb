class WorkoutExercise < ApplicationRecord

  # ASSOCIATIONS
  belongs_to :workout
  belongs_to :exercise
end
