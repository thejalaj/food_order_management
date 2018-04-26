class RemoveAllTables < ActiveRecord::Migration[5.1]
  def up
    drop_table :userrs
  end

  def down
    fail ActiveRecord::IrreversibleMigration
  end
end
