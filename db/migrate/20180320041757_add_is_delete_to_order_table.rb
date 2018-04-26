class AddIsDeleteToOrderTable < ActiveRecord::Migration[5.1]
  def change
    add_column :order_tables, :is_deleted, :boolean
  end
end
