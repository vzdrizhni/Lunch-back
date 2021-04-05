class CreateMenuItems < ActiveRecord::Migration[6.1]
  def change
    create_table :menu_items do |t|
      t.integer :type
      t.references :menu, null: false, foreign_key: true

      t.timestamps
    end
  end
end
