# frozen_string_literal: true

class MenuItem < ApplicationRecord
  enum menu_item_type: %i[first_course main_course drink]

  has_one_attached :image
  has_many :menus
  has_many :weekdays, through: :menus
  has_many :order_items
  has_many :orders, through: :order_items, foreign_key: :menu_item_id

  validates :name, presence: true, length: { in: 1..50 }, uniqueness: true
  validates :price, presence: true

  validates :image, {
    presence: true
  }
end
