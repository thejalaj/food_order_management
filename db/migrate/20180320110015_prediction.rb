class Prediction < ActiveRecord::Migration[5.1]
  def change
    rename_column :order_tables, :prediction, :food_prediction_id
  end
end
