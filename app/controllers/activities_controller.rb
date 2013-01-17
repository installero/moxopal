class ActivitiesController < ApplicationController
  def create
    activity = Activity.create(params[:activity])
    if activity.accepted
      redirect_path = activity.context
    else
      redirect_path = activity.context.next
    end
    redirect_to redirect_path
  end
end
