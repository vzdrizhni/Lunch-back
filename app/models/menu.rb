class Menu < ApplicationRecord
  belongs_to :weekday
  has_many :menu_items

  before_save :default_values

  def default_values
    self.title = DateTime.current.beginning_of_day unless self.title
  end
end
