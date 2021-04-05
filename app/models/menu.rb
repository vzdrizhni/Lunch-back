class Menu < ApplicationRecord
  belongs_to :weekday
  belongs_to :menu_item  
end
