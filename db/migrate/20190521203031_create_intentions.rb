class CreateIntentions < ActiveRecord::Migration[5.2]
  def change
    create_table :intentions do |t|
      t.references :exercise, foreign_key: true
      t.references :muscle, foreign_key: true
      t.boolean :primary_muscle

      t.timestamps
    end
  end
end
