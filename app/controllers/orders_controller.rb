# frozen_string_literal: true

class OrdersController < ApplicationController
  def update
    order = Order.find(params[:id])

    order.order_items.destroy_all unless order.order_items.empty?

    params[:menu_items].map { |hash| order.order_items.create!(menu_item_id: hash[:id]) }

    if order
      render json: { success: true, data: order.order_items }
    else
      render json: { success: false, message: order.errors.full_messages }
    end
  end

  def create
    weekday = Weekday.find(params[:weekday_id])

    order = Order.create(weekday: weekday, user: @user)
    params[:menu_items].map { |hash| order.order_items.create(menu_item_id: hash.dig(:id)) }

    if order.valid?
      render json: { success: true, data: order.menu_items }
    else
      render json: { success: false, message: order.errors.full_messages }
    end
  end

  private

  def order_params
    params.permit(menu_items: [:id]).require(:menu_items)
  end
end
