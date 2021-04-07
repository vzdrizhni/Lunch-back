class OrderSerializer < ActiveModel::Serializer
  attributes :id

  has_many :menu_items
end
