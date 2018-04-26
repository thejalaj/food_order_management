class CreateFoodPrediction < ActiveRecord::Migration[5.1]
  def change
    create_table :food_predictions do |t|
      t.string :time
      t.integer :food_id
      t.integer :prediction
    end
  end
end
