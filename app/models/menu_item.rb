class MenuItem < ApplicationRecord
  enum menu_item_type: [:first_course, :main_course, :drink]

  has_many :menus
  has_many :weekdays, through: :menus
  has_many :order_items
  has_many :orders, through: :order_items, foreign_key: :menu_item_id

  accepts_nested_attributes_for :orders
end
