class CreateWorkoutExercises < ActiveRecord::Migration[7.0]
  def change
    create_table :workout_exercises do |t|
      t.references :workout, null: false, foreign_key: true
      t.references :exercise, null: false, foreign_key: true
      t.integer :repetitions, null: false, default: 1

      t.timestamps
    end
  end
end
