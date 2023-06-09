class CreateExercises < ActiveRecord::Migration[7.0]
  def change
    create_table :exercises do |t|
      t.string :name, null: false
      t.references :category, null: false, foreign_key: true
      t.string :description

      t.timestamps
    end
  end
end
