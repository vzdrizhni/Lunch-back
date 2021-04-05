class Menu < ApplicationRecord
  belongs_to :weekday
  has_many :menu_items
end
