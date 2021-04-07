# frozen_string_literal: true

class RemoveTitleFromMenu < ActiveRecord::Migration[6.1]
  def change
    remove_column :menus, :title, :string
  end
end
