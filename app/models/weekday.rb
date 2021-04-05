class Weekday < ApplicationRecord
    has_many :menus, foreign_key: "weekday_id"
end
