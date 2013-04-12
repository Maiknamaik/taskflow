class TasksController < ApplicationController

  hobo_model_controller

  auto_actions :all
  auto_actions :write_only, :edit

  auto_actions_for :workday, :create

  def create_for_workday
    hobo_create do
      redirect_to "/workdays/#{params[:workday_id]}"
    end
  end

  def update
    hobo_update do
      redirect_to "/workdays/#{params[:workday_id]}"
    end
  end  
  
  
end
