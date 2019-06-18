class AddFieldToRegiments < ActiveRecord::Migration[5.2]
    def change
        add_column :regiments, :weight, :integer
    end
end
