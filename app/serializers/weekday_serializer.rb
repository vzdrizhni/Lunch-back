class WeekdaySerializer < ActiveModel::Serializer
  attributes :id, :name, :created_at

  has_many :menu_items
  has_many :menus
  has_many :orders
end
