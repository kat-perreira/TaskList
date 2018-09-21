



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
    task = Task.new(
      name: params[:task][:name],
      completion_date: params[:task][:completion_date],
      description: params[:task][:description]
    ) #instantiate a new task

    save_success = task.save

    if save_success # save returns true if the database insert succeeds
      redirect_to tasks_path # go to the index so we can see the book in the list
    else # save failed
      render :new # show the new book form view again
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
      @task.update(
        name: params[:task][:name],
        completion_date: params[:task][:completion_date],
        description: params[:task][:description]
      )

        redirect_to task_path(@task)
  end

  def destroy
    Task.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to tasks_path
  end

end
