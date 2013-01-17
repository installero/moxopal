class Task < ActiveRecord::Base
  belongs_to :context
  has_many :activities, :dependent => :destroy
end
