class AddUniqueIndexToIntentions < ActiveRecord::Migration[5.2]
  def change
      add_index :intentions, [:muscle_id, :exercise_id], unique: true
  end
end
