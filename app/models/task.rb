class Task < ActiveRecord::Base
  belongs_to :context
  has_many :activities, :dependent => :destroy
  after_create{|t| t.status = 'active'; t.save}
end
