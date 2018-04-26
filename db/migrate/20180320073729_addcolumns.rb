class Addcolumns < ActiveRecord::Migration[5.1]
  def change
    add_column :order_tables, :created_at, :datetime, default: Time.zone.now, null: false
    add_column :food_predictions, :created_at, :datetime, default: Time.zone.now, null: false
  end
end
