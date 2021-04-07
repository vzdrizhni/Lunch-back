class MenuItemSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id, :name, :price, :menu_item_type, :image

  def image
    object.image.service_url if object.image.attached?
  end
end
