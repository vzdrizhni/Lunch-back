class Order < ApplicationRecord
  has_one :user
  has_one :weekday
  has_many :menu_items
end
