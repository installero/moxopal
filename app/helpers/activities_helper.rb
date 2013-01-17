# coding=utf-8
module ActivitiesHelper
  def symbol(activity)
    activity.accepted ? '✔' :  '•'
  end
end
