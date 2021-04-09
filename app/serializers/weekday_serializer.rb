class WeekdaySerializer < ActiveModel::Serializer
  attributes :id, :name

  has_many :menu_items
  has_many :menus

  # def image
  #   object.menu_items.image.service_url if object.menu_items.image.attached?
  # end
end
