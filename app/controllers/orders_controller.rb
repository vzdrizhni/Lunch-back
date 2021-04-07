# frozen_string_literal: true

class OrdersController < ApplicationController
  before_action :is_admin?, only: [:index]

  def index
    orders = Order.all

    if orders
      orders_serialized = parse_json orders
      render json: { success: true, data: orders_serialized}
    else
      render json: { success: false, message: 'Something went wrong'}
    end
  end

  def update
    order = Order.find(params[:id])

    order.order_items.destroy_all unless order.order_items.empty?

    params[:menu_items].map { |hash| order.order_items.create!(menu_item_id: hash[:id]) }
    order_serializer = parse_json order

    if order.valid?
      render json: { success: true, data: order_serializer}
    else
      render json: { success: false, message: order.errors.full_messages }
    end
  end

  def create
    weekday = Weekday.find(params[:weekday_id])

    order = Order.create(weekday: weekday, user: @user)
    params[:menu_items].map { |hash| order.order_items.create(menu_item_id: hash.dig(:id)) }
    order_serializer = parse_json order

    if order.valid?
      render json: { success: true, data: order_serializer }
    else
      render json: { success: false, message: order.errors.full_messages }
    end
  end

  def destroy
    order = Order.find(params[:id])
    order.destroy

    if order
      render json: { success: true, message: "An order with #{order.id} was deleted" }
    else
      render json: { success: false, message: "Something went wrong" }
    end
  end

  private

  def order_params
    params.permit(menu_items: [:id]).require(:menu_items)
  end
end
