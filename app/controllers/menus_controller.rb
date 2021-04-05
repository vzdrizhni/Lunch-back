class MenusController < ApplicationController
    before_action :is_admin?

    def index
        menu = Menu.all
        if menu
            render json: {success: true, data: menu}
        else
            render json: {success: false, message: "There is no menus"}
        end
    end

    def show
        menu = Menu.find(params[:id])

        if menu
            render json: {success: true, data: menu}
        else
            render json: {success: false, message: "There is no menus"}
        end
    end
    
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

    def destroy
        menu = Menu.find(params[:id])
        if menu
            menu.destroy
            render json: {success: true, message: "A menu with #{menu.id} was deleted"}
        else
            render json: {success: false, message: menu.errors.full_messages}
        end
    end

    def update
        menu = Menu.find(params[:id])
        if menu
            menu.update(menu_params)
            render json: {success: true, message: "A menu with #{menu.id} was updated", data: menu}
        else
            render json: {success: false, message: "There is no such menu"}
        end
    end

    private

    def menu_params
        params.require(:menu).permit(:title)        
    end
end
