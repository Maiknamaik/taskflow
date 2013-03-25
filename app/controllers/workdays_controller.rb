class WorkdaysController < ApplicationController

  hobo_model_controller

  auto_actions :all

  def index
    @date = Date.today
    hobo_index
  end

  def new
    @workday=Workday.new(:date_time => params[:day])

  end
end
