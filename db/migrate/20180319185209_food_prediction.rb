class FoodPrediction < ActiveRecord::Migration[5.1]
  def change
      add_column :food_predictions, :user_id, :integer
  end
end
