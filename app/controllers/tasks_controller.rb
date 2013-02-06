class TasksController < ApplicationController
  def new
    if params[:id]
      @task = Context.find(params[:id]).tasks.new
    end
  end

  def show
  end

  def index
  end

  def edit
  end

  def update
    @task = Task.find params[:id]
    @task.update_attributes(params[:task])
    @task.save
    if @task.status == 'done'
      @task.context.active_task = nil
      @task.context.save
    end
  end

  def create
    task = Task.new params[:task]

    p params[:task]

    respond_to do |format|
      if task.save!
        flash[:notice] = 'Task created'
        format.html { redirect_to task.context }
      else
        format.html { redirect_to new_task_path }
      end
    end
  end

end
