class WeekdaySerializer < ActiveModel::Serializer
  attributes :id, :name, :created_at

  has_many :menu_items
  has_many :menus
  has_many :orders

  # def image
  #   object.menu_items.image.service_url if object.menu_items.image.attached?
  # end
end
