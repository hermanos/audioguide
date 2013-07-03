class RemoveCoinsFromUsers < ActiveRecord::Migration
  def up
    remove_column :users, :coins
  end

  def down
    add_column :users, :coins, :integer
  end
end
