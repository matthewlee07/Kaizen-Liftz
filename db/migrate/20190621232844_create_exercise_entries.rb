class CreateExerciseEntries < ActiveRecord::Migration[5.2]
  def change
    create_table :exercise_entries do |t|
      t.references :workout_entry, foreign_key: true
      t.references :exercise, foreign_key: true
      t.integer :weight
      t.integer :sets
      t.integer :reps
      t.text :comments

      t.timestamps
    end
  end
end
