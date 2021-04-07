# frozen_string_literal: true

class AddNameToMenuItems < ActiveRecord::Migration[6.1]
  def change
    add_column :menu_items, :name, :string
    add_column :menu_items, :add_price_to_menu_items, :string
    add_column :menu_items, :price, :float
  end
end
