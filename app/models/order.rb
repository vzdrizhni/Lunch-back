# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :user
  belongs_to :weekday
  has_many :order_items, dependent: :destroy
  has_many :menu_items, through: :order_items, foreign_key: :order_id

  validates :order_items, length: { maximum: 3 }
end
