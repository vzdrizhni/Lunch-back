class Remove < ActiveRecord::Migration[6.1]
  def change
    remove_column :menu_items, :menu_id, :string
  end
end
