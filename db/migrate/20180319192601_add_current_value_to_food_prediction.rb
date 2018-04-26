class AddCurrentValueToFoodPrediction < ActiveRecord::Migration[5.1]
  def change
    add_column :food_predictions, :cuurent_quantity, :integer
  end
end
