class AddNewIndexToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :last_active, null: false
  end
end
