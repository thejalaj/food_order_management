class CreateTables < ActiveRecord::Migration[5.1]
  def change
    create_table :userrs do |t|
      t.string "name"
      t.string "email"
      t.string "password_digest"
      t.integer "role"
      t.datetime :modified_at, default: -> { 'CURRENT_TIMESTAMP' }
      t.timestamps
    end
    create_table :foods do |t|
      t.string :name
      t.datetime :modified_at, default: -> { 'CURRENT_TIMESTAMP' }
      t.timestamps
    end
    create_table :food_predictions do |t|
      t.integer "food_id"
      t.integer "prediction"
      t.integer "userr_id"
      t.integer "cuurent_quantity"
      t.datetime :modified_at, default: -> { 'CURRENT_TIMESTAMP' }
      t.timestamps
    end
    create_table :order_tables do |t|
      t.integer "userr_id"
      t.integer "food_id"
      t.integer "quantity"
      t.boolean "is_deleted"
      t.datetime :modified_at, default: -> { 'CURRENT_TIMESTAMP' }
      t.timestamps
    end
  end
end
