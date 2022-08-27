module Admin
  class Admin::CalendarController < ApplicationController
    before_action :authenticate_admin

    def new
      @calendar_adm = Calendar.new
    end

    def create
      (0..end_date_loop).each do |i|
        iterated_day = start_date_selected + i
        calendar_adm = Calendar.new(teacher_id: current_user.teacher.id, reference_day: iterated_day).save
      end
    end

    private
    def authenticate_admin
      unless current_user&.admin
        flash[:error] = "You're not a adminstrator"
        redirect_to root_path
      end
    end

    def end_date_loop
      (end_date_selected - start_date_selected).to_i
    end
  
    def start_date_selected
      Date.strptime(custom_params.values[0..2].join('-'), "%d-%m-%Y")
    end
  
    def end_date_selected
      Date.strptime(custom_params.values[3..5].join('-'), "%d-%m-%Y")
    end
  
    def custom_params
      params.require(:calendar).permit(:start_date, :end_date)
    end

  end
end
