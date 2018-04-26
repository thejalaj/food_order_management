class RemoveExtrasModifiedAt < ActiveRecord::Migration[5.1]
  def up
    drop_table :order_tables
    drop_table :food_predictions
    drop_table :foods
  end

  def down
    fail ActiveRecord::IrreversibleMigration
  end
end
