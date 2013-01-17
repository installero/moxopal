class Activity < ActiveRecord::Base
  belongs_to :context
  belongs_to :task
end
