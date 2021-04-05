class MenuItem < ApplicationRecord
  belongs_to :menu

  enum menu_item_type: [:first_course, :main_course, :drink]
end
