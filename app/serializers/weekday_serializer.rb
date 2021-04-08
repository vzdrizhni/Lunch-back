class WeekdaySerializer < ActiveModel::Serializer
  attributes :id, :name

  has_many :menu_items
end
