class AddIndexToItemsEmail < ActiveRecord::Migration
  def change
    add_index :items, :email, unique: true
  end
end
