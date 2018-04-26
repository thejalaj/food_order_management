class AddingTimeStamp < ActiveRecord::Migration[5.1]
  def change
    change_table :order_tables do |t|
    #  t.timestamps
    end
    change_table :food_predictions do |t|
    #  t.timestamps
    end
  end
end
