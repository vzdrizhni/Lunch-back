# frozen_string_literal: true

class AddTitleToMenus < ActiveRecord::Migration[6.1]
  def change
    add_column :menus, :title, :string
  end
end
