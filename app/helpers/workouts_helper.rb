module WorkoutsHelper
  def workout_level(workout, chr)
    chr * (Workout.levels[workout.level] + 1)
  end
end
