# frozen_string_literal: true

class ChangeColumnName < ActiveRecord::Migration[6.1]
  def change
    rename_column :menus, :menu_items_id, :menu_item_id
  end
end
