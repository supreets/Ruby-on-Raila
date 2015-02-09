class AddIndexToItemsTitleDescription < ActiveRecord::Migration
  def change
    add_index :items, [:title,:description]
  end
end
