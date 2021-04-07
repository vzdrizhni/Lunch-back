# frozen_string_literal: true

class MenuItemsController < ApplicationController
  before_action :is_admin?

  def create
    menu_item = MenuItem.new(menu_item_params)
    if menu_item.valid?
      menu_item.save
      render json: { success: true, data: menu_item }
    else
      render json: { message: menu_item.errors.full_messages }
    end
  end

  def update
    menu_item = MenuItem.update(params[:id], menu_item_params)
    if menu_item.valid?
      menu_item.save
      render json: { success: true, data: menu_item }
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
    params.require(:menu_item).permit(:menu_item_type, :name, :price, :image)
  end
end
