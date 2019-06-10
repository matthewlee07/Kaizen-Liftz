class LogExercise < ActiveRecord::Migration[5.2]
  def change
    create_table :log_exercises do |t|
        t.references :log, foreign_key: true
        t.references :exercise, foreign_key: true
  
        t.timestamps
      end
  end
end
