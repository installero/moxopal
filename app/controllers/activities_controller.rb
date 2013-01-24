class ActivitiesController < ApplicationController
  def create
    activity = Activity.create(params[:activity])
    if activity.accepted
      activity.context.start
      redirect_path = activity.context
    else
      Context.stop_all
      redirect_path = activity.context.next
    end
    redirect_to redirect_path
  end
end
