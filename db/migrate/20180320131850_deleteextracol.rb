class Deleteextracol < ActiveRecord::Migration[5.1]
  def change
    remove_column :order_tables, :food_prediction_id, :integer
    remove_column :order_tables, :created_till_now, :integer
    remove_column :order_tables, :created_at, :integer
    remove_column :food_predictions, :created_at, :integer
    remove_column :order_tables, :time, :integer
  end
end
