class TimeslotsController < ApplicationController
  before_action :check_teacher, except: [:index]

  def index
    @time_slots_all = Timeslot.all
    @calendar_week_day = Calendar.all
  end

  def new
    @time_slots = Timeslot.new
  end

  def create
    Calendar.all.each do |calendar|
      day = calendar.reference_day.strftime('%A')
      if day == "Monday"
        (0..length1).each do |x|
          final_slots = Timeslot.new(teacher_id: current_user.teacher.id,
          start_slot: looping_slots(morning_start + (4 * 3600 ))[x],
          end_slot: looping_slots(morning_start + (5 * 3600))[x],
          calendar_id: calendar.id
          )
          final_slots.save
        end
      elsif day == "Tuesday" || day == "Wednesday" || day == "Friday" || day == "Thursday"
        (0..length2).each do |x|
          final_slots = Timeslot.new(teacher_id: current_user.teacher.id,
          start_slot: loop_full_day(morning_start)[x],
          end_slot: loop_full_day(morning_start + 3600)[x],
          calendar_id: calendar.id
          )
          final_slots.save
        end
      elsif day == "Saturday"
        (0..length1).each do |x|
          final_slots = Timeslot.new(teacher_id: current_user.teacher.id,
          start_slot: looping_slots(morning_start)[x],
          end_slot: looping_slots(morning_start + 3600)[x],
          calendar_id: calendar.id
          )
          final_slots.save
        end
      end
    end
  end

  private
  def check_teacher
    unless current_user.teacher
        redirect_to '/', :alert => "Don't have permission!"
    end
  end

  def length1
    looping_slots(morning_start + (4 * 3600)).length - 1
  end

  def length2
    loop_full_day(morning_start).length - 1
  end

  def looping_slots(slot)
    (0..4).map do |i|
      (slot + i * 3600).hour.to_s
    end
  end

  def loop_full_day(slot)
    [0,1,2,3,4,6,7,8,9].map do |i|
      (slot + (i * 3600)).hour.to_s
    end
  end

  def morning_start
    Time.parse("08:00")
  end

end
