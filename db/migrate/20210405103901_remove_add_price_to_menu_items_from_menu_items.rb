# frozen_string_literal: true

class RemoveAddPriceToMenuItemsFromMenuItems < ActiveRecord::Migration[6.1]
  def change
    remove_column :menu_items, :add_price_to_menu_items, :string
  end
end
