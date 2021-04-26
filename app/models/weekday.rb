# frozen_string_literal: true

class Weekday < ApplicationRecord
  has_many :menus, foreign_key: 'weekday_id', dependent: :destroy
  has_many :menu_items, through: :menus
  has_many :orders, dependent: :destroy

  # scope :excluded_menu_items, -> { self.menu_items.select { |item| !self.menu_items.include?(item)} }
  def excluded_menu_items(all_menu_items)
    self.menu_items.select { |item| all_menu_items.include?(item) }
  end

  # default_scope -> { order(created_at: :desc) }

  before_save :default_values

  def default_values
    self.date = DateTime.current.beginning_of_day
    self.name = Time.new.strftime('%d of %B, %Y').to_s
  end
end
