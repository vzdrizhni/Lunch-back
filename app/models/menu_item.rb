# frozen_string_literal: true

class MenuItem < ApplicationRecord
  include Rails.application.routes.url_helpers

  enum menu_item_type: %i[first_course main_course drink]

  has_one_attached :image
  has_many :menus
  has_many :weekdays, through: :menus
  has_many :order_items
  has_many :orders, through: :order_items, foreign_key: :menu_item_id

  validates :image, {
    presence: true
  }

  def get_image_url
    url_for(image)
  end
end
