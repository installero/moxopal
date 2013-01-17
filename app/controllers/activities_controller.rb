class ActivitiesController < ApplicationController
  def create
    activity = Activity.create(params[:activity])
    redirect_to activity.context
  end
end
