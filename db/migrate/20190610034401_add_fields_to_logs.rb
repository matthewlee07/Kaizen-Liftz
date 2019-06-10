class AddFieldsToLogs < ActiveRecord::Migration[5.2]
  def change
    add_column :logs, :weight, :integer
    add_column :logs, :sets, :integer
    add_column :logs, :reps, :integer
  end
end
