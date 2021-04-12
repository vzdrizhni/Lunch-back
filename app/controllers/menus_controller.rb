# frozen_string_literal: true

class MenusController < ApplicationController

    def create
        weekday = Weekday.find(params[:weekday_id])

        params[:menu_items].map { |hash| weekday.menus.create!(menu_item_id: hash[:id]) } if params[:menu_items]
        weekday_serializer = parse_json weekday
        render json: {success: true, data: weekday_serializer}
    end

    def update
        weekday = Weekday.find(params[:weekday_id])

        weekday.menus.destroy_all
        params[:menu_items].map { |hash| weekday.menus.create!(menu_item_id: hash[:id]) } if params[:menu_items]
        weekday_serializer = parse_json weekday
        render json: {success: true, data: weekday_serializer}
    end

    private

    def order_params
        params.permit(menu_items: [:id]).require(:menu_items)
    end
end
