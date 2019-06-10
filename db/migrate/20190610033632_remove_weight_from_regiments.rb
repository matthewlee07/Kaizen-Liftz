class RemoveWeightFromRegiments < ActiveRecord::Migration[5.2]
  def change
      remove_column :regiments, :weight
  end
end
