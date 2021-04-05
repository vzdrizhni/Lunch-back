class WeekdaysController < ApplicationController
    before_action :is_admin?

    def create
        weekday = Weekday.create
        render json: {success: true, data: weekday}
    end
    
    def destroy
        puts params
        weekday = Weekday.find(params[:id])
        if weekday
            weekday.destroy
            render json: {success: true, message: "A day with #{weekday.id} was successfully destroyed"}
        else
            render json: {success: false, message: "There is no such day"}
        end
    end 

end
