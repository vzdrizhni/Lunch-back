class AddMenuItemsToMenus < ActiveRecord::Migration[6.1]
  def change
    add_reference :menus, :menu_items, null: false, foreign_key: true
  end
end
