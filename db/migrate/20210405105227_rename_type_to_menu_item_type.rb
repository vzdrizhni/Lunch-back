# frozen_string_literal: true

class RenameTypeToMenuItemType < ActiveRecord::Migration[6.1]
  def change
    change_table :menu_items do |t|
      t.rename :type, :menu_item_type
    end
  end
end
