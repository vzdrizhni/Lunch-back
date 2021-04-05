class MenusController < ApplicationController
    before_action :is_admin?
    
    def create
        weekdays = Weekday.find(params[:weekday_id])
        menu = weekdays.menus.build(menu_params)
        if menu.valid?
            menu.save
            render json: {success: true, data: menu}
        else
            render json: {success: false, message: menu.errors.full_messages}
        end
    end

    private

    def menu_params
        params.require(:menu).permit(:title)        
    end
end
