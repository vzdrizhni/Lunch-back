# frozen_string_literal: true

class MenuItemsController < ApplicationController
  before_action :is_admin?

  def index
    menu_items = MenuItem.all
    if menu_items
      menu_item_serializer = parse_json menu_items
      render json: { success: true, data: menu_item_serializer}
    else
      render json: { message: 'No items were found', success: false}
    end
  end
  

  def show
    menu_item = MenuItem.find(params[:id])
    menu_item_serializer = parse_json menu_item
    if menu_item
        render json: { success: true, data: menu_item_serializer}
    else
        render json: { message: 'No item was found', success: false}
    end
  end
  

  def create
    menu_item = MenuItem.new(menu_item_params)
    menu_item_serializer = parse_json menu_item
    if menu_item.valid?
      menu_item.save
      render json: { success: true, data: menu_item_serializer}
    else
      render json: { message: menu_item.errors.full_messages }
    end
  end

  def update
    menu_item = MenuItem.update(params[:id], menu_item_params)
    menu_item_serializer = parse_json menu_item
    if menu_item.valid?
      menu_item.save
      render json: { success: true, data: menu_item_serializer }
    else
      render json: { message: menu_item.errors.full_messages }
    end
  end

  def destroy
    menu_item = MenuItem.find(params[:id])

    if menu_item
      menu_item.destroy
      render json: { message: 'MenuItem was successfully destroyed' }
    else
      render json: { message: 'MenuItem was not found' }
    end
  end

  private

  def menu_item_params
    params.permit(:menu_item_type, :name, :price, :image)
  end
end
