require 'date'


class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end

  def show
    task_id = params[:id]
    @task= Task.find_by(id: task_id)
    if @task.nil?
      head :not_found
    end
  end

  def new
    @task = Task.new
  end

  def create
    filtered_params = task_params()
    @task = Task.new(filtered_params)
    save_success = @task.save
    if save_success
      redirect_to tasks_path
    else
      render :new
    end
  end

  def edit
    @task = Task.find_by(id: params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    redirect_to tasks_path
  end

  def destroy
    task = Task.find_by(id: params[:id])
    task.destroy
    redirect_to root_path
  end

  def complete
    todays_date = Date.today
    @task = Task.find_by(id: params[:id])
    @task.update(completed: true, date_completed: todays_date)
    redirect_to root_path
  end

  private

  def task_params
    return params.require(:task).permit(
      :name,
      :completion_date,
      :description,
    )
  end

end
