class Weekday < ApplicationRecord
    has_many :menus, foreign_key: "weekday_id"

    before_save :default_values

    def default_values
      self.date = DateTime.current.beginning_of_day
      self.name = Time.new.strftime("%d of %B, %Y").to_s
    end
end
