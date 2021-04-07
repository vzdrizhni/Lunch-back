# frozen_string_literal: true

class Order < ApplicationRecord
  enum status: %i[accepted pending rejected]

  belongs_to :user
  belongs_to :weekday
  has_many :order_items, dependent: :destroy
  has_many :menu_items, through: :order_items

  validates :order_items, length: { maximum: 3 }
  default_scope -> { order(created_at: :desc) }

  before_save :set_total_price, :set_default_status

  private

  def set_total_price
    self.total_price = menu_items.inject(0) {|sum, item| sum + item[:price]}.round(2)
  end

  def set_default_status
    self.status = 'pending'
  end
end
