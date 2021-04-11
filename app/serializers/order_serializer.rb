class OrderSerializer < ActiveModel::Serializer
  attributes :id, :total_price, :status

  has_many :menu_items
  belongs_to :weekday
end
