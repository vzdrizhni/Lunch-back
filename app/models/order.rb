# frozen_string_literal: true

class Order < ApplicationRecord
  enum status: %i[accepted pending rejected]

  belongs_to :user
  belongs_to :weekday
  has_many :order_items, dependent: :destroy
  has_many :menu_items, through: :order_items

  validates :order_items, length: { maximum: 3 }
  default_scope -> { order(created_at: :desc) }

  after_save :set_default_status
  before_validation :set_total_price

  private

  def set_total_price
    self.total_price = menu_items.sum(:price)
  end

  def set_default_status
    self.status = 'pending'
  end
end
