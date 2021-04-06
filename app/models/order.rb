class Order < ApplicationRecord
  belongs_to :user
  belongs_to :weekday
  has_many :order_items
  has_many :menu_items, through: :order_items, foreign_key: :order_id
end
