class CreateRegiments < ActiveRecord::Migration[5.2]
  def change
    create_table :regiments do |t|
      t.references :exercise, foreign_key: true
      t.references :workout, foreign_key: true
      t.integer :weight
      t.integer :sets
      t.integer :reps

      t.timestamps
    end
  end
end
