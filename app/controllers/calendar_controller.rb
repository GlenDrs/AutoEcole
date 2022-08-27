class CalendarController < ApplicationController
  before_action :check_teacher, except: [:index, :show]

  def index
    @calendar_all = Calendar.where("reference_day >= ?", Date.today)
  end

  def show
    @lessons = Lesson.all
    @calendar_selected = Calendar.find(params[:id])
  end

  def new
    @calendar = Calendar.new
  end

  def create
    (0..end_date_loop).each do |i|
      iterated_day = start_date_selected + i
      calendar = Calendar.new(:teacher_id => current_user.teacher.id, :reference_day => iterated_day).save
    end
    redirect_to calendar_index_path
  end

  private
  def check_teacher
    unless current_user.teacher != nil || current_user.admin == true
      redirect_to '/', :alert => "Don't have permission!"
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
