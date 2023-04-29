class CreateWorkouts < ActiveRecord::Migration[7.0]
  def change
    create_table :workouts do |t|
      t.string :name, null: false
      t.references :category, null: false, foreign_key: true
      t.integer :level, null: false
      t.text :description

      t.timestamps
    end
  end
end
