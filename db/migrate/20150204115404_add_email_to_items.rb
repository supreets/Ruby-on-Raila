class AddEmailToItems < ActiveRecord::Migration
  def change
    add_column :items, :email, :string
  end
end
