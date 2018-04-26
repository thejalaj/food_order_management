class AddQuantiyToOrderTable < ActiveRecord::Migration[5.1]
  def change
    add_column :order_tables, :quantity, :integer
  end
end
