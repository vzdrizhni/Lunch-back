class MenuItem < ApplicationRecord
  enum menu_item_type: [:first_course, :main_course, :drink]

  has_many :menus
  has_many :weekdays, through: :menus  
end
