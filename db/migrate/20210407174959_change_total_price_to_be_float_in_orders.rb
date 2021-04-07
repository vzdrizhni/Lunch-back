class ChangeTotalPriceToBeFloatInOrders < ActiveRecord::Migration[6.1]
  def change
    change_column :orders, :total_price, :float
  end
end
