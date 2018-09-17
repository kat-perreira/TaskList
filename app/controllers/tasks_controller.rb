

TASKS =["task_one", "task_two", "task_three"]

class TasksController < ApplicationController

  def index
    @tasks = TASKS
  end

end
