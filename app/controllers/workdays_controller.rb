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

end


