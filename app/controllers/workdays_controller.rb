class WorkdaysController < ApplicationController

  hobo_model_controller

  auto_actions :all

  def index
    @date = params[:month] ? Date.parse(params[:month]+'-01') : Date.today
    hobo_index
  end

  def new
    @workday=Workday.new(:date_time => params[:day])
    @workday.save
    redirect_to @workday
  end

  def show
#   Se puede buscar tanto por fecha como por id del Workday
#    @Taskes = Task.joins(:workday).where(:workdays => {:date_time => params[day.to_s]})
    @Tasks_array = Task.joins(:workday).where(:workdays => {:id => params[:id]})
    hobo_show
  end

end


