class RemoveExtras < ActiveRecord::Migration[5.1]
  def change
    remove_column :food_predictions, :updated_at
    remove_column :foods, :updated_at
    remove_column :order_tables, :updated_at
    remove_column :userrs, :updated_at
    remove_column :userrs, :role, :integer
  end
end
