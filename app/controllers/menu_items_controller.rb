class MenuItemsController < ApplicationController
    def create
        menu_item = MenuItem.new(menu_item_params)
        if menu_item.valid?
            menu_item.save
            render json: {success: true, data: menu_item}
        end
    end

    private

    def menu_item_params
        params.require(:menu_item).permit(:menu_item_type, :name, :price)
    end
end
