class RemoveMenuItemIdFromOrder < ActiveRecord::Migration[6.1]
  def change
    remove_column :orders, :menu_item_id, :integer
  end
end
