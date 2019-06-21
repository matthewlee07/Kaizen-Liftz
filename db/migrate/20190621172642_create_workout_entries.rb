class CreateWorkoutEntries < ActiveRecord::Migration[5.2]
  def change
    create_table :workout_entries do |t|
      t.references :workout, foreign_key: true
      t.datetime :start_time
      t.datetime :stop_time
      t.text :comments

      t.timestamps
    end
  end
end
