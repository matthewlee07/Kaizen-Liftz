class CreateLogEntries < ActiveRecord::Migration[5.2]
  def change
    create_table :log_entries do |t|
      t.references :log, foreign_key: true
      t.datetime :start_time
      t.datetime :stop_time
      t.integer :weight
      t.integer :sets
      t.integer :reps
      t.text :comments

      t.timestamps
    end
  end
end
