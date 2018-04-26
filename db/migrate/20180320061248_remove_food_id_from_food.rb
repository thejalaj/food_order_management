class RemoveFoodIdFromFood < ActiveRecord::Migration[5.1]
  def change
    remove_column :foods, :food_id, :integer
  end
end
