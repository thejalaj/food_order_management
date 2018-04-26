class CreateOrderTable < ActiveRecord::Migration[5.1]
  def change
    create_table :order_tables do |t|
      t.integer :user_id
      t.string :time
      t.integer :food_id
      t.integer :prediction
      t.integer :created_till_now
    end
  end
end
