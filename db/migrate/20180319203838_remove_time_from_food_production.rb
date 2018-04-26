class RemoveTimeFromFoodProduction < ActiveRecord::Migration[5.1]
  def change
    remove_column :food_predictions, :time, :string
  end
end
