class OrderSerializer < ActiveModel::Serializer
  attributes :id, :total_price, :status

  has_many :menu_items
end
