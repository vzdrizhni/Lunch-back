class MenuItem < ApplicationRecord
  enum menu_item_type: [:first_course, :main_course, :drink]

  
end
