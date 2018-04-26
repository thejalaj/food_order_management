class AddRoleToUserr < ActiveRecord::Migration[5.1]
  def change
    add_column :userrs, :role, :integer
  end
end
