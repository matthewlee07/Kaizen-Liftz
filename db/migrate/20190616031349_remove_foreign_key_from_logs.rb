class RemoveForeignKeyFromLogs < ActiveRecord::Migration[5.2]
  def change
    remove_reference :logs, :regiment
  end
end
