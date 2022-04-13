class CalendarController < ApplicationController

  def index
    @calendar_all = Calendar.all
  end

  def new
    @current_teacher_id = current_user.teacher.id
    @calendar = Calendar.new
  end

  def create
    @calendar = Calendar.new(calendar_params)
    if @calendar.save
      redirect_to calendar_index_path
    else
      render 'new'
      flash[:notice] = 'Pas de création de calendrier!'
    end
  end

  def show
  end

  private
  def calendar_params
    params.require(:calendar).permit(:start_date, :time_slots, :end_date, :teacher_id)
  end

end
