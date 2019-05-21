class CreateLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :logs do |t|
      t.references :user, foreign_key: true
      t.references :regiment, foreign_key: true
      t.text :comments

      t.timestamps
    end
  end
end
