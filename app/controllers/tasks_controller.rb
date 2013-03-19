class TasksController < ApplicationController

  hobo_model_controller

  auto_actions :all
  auto_actions :write_only, :edit

  auto_actions_for :workday, :create

end
