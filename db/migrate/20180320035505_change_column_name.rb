class ChangeColumnName < ActiveRecord::Migration[5.1]
  def change
    rename_column :food_predictions, :user_id, :userr_id
    rename_column :order_tables, :user_id, :userr_id
  end
end
