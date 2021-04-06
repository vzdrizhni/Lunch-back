class OrdersController < ApplicationController   

    def create
        weekday = Weekday.find(params[:weekday_id])       

        order = Order.new(weekday: weekday, user: @user)
        
        if order.valid?
            order.save
            order_params.map { |hash| order.order_items.create(menu_item_id: hash.dig(:id)) }      
            render json: {success: true, data: order.order_items}
        else
           render json: {success: false, message: order.errors.full_messages}
        end
    end

    private

    def order_params
        params.permit(menu_items: [:id]).require(:menu_items)
    end
    
end
