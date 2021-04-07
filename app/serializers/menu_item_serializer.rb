class MenuItemSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id, :name, :price, :menu_item_type, :image

  has_many :orders

  def image
    object.image.service_url if object.image.attached?
  end
end
