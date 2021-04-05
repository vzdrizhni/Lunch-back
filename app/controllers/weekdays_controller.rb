class WeekdaysController < ApplicationController
    before_action :is_admin?

    def create
        weekday = Weekday.create
        render json: {success: true, data: weekday}
    end
    
    def destroy
        weekday = weekday.find(params[:id])
        if weekday
            weekday.destroy
            render json: {success: true, message: "A day was successfully destroyed"}
        else
            render json: {success: false, message: "There is no such day"}
        end
    end
    

end
