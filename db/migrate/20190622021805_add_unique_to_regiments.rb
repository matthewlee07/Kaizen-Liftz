class AddUniqueToRegiments < ActiveRecord::Migration[5.2]
  def change
    add_index :regiments, [:exercise_id, :workout_id], unique: true
  end
end
