class ActivitiesController < ApplicationController
  def create
    activity = Activity.create(params[:activity])
    if activity.accepted
      if activity.task
        activity.context.start :active_task_id => activity.task.id
      else
        activity.context.start
      end
      redirect_path = activity.context
    else
      Context.stop_all
      redirect_path = activity.context.next
    end
    redirect_to redirect_path
  end
end
