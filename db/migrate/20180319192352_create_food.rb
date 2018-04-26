class CreateFood < ActiveRecord::Migration[5.1]
  def change
    create_table :foods do |t|
      t.string :name
      t.integer :food_id
    end
  end
end
