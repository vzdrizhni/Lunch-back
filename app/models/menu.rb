class Menu < ApplicationRecord
  belongs_to :weekday
  belongs_to :menu_item
  
  validates_uniqueness_of :weekday_id, :scope => :menu_item_id, :message => "The menu can only have one menu item of this name"
end
