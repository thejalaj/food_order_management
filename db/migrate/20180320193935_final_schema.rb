class FinalSchema < ActiveRecord::Migration[5.1]
  def change
    create_table :userrs do |t|
      t.string "name"
      t.string "email"
      t.string "password_digest"
      t.timestamps
    end
    create_table :foods do |t|
      t.string "name"
      t.timestamps
    end
    create_table :food_predictions do |t|
      t.integer "food_id"
      t.integer "prediction"
      t.integer "userr_id"
      t.timestamps
    end
    create_table :order_tables do |t|
      t.integer "userr_id"
      t.integer "food_id"
      t.integer "quantity"
      t.boolean "is_deleted"
      t.timestamps
    end
  end
end
