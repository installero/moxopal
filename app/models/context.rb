class Context < ActiveRecord::Base
  has_attached_file :picture, :styles => {:medium => "250x250>", :thumb => "80x80>"}
  has_many :tasks, :dependent => :destroy
  has_many :activities, :dependent => :destroy

  accepts_nested_attributes_for :tasks

  after_create{|c| c.position = c.id; c.status = 'common'; c.save}

  default_scope where("status IN ('common','active')").order('position')
  scope :archived, where(:status => 'archived')

  def active_tasks
    tasks.where("status IN ('active')")[0..2]
  end

  def self.shuffle_positions
    Context.all.shuffle.each_with_index do |c,i|
      c.position = i
      c.save
    end
  end

  def next
    contexts = Context.all
    context = contexts[contexts.index(self) + 1]
    context = contexts.first if context.nil?
    return context
  end

  def start
    Context.stop_all
    self.status = 'active'
    self.save
  end

  def active?
    status == 'active'
  end

  def self.stop_all
    Context.where(:status => 'active').each{|c| c.status = 'common'; c.save}
  end

  def time_passed
   (Time.now - activities.last.created_at).round
  end

  def archive
    self.status = 'archived'
    self.save
  end

  def unarchive
    self.status = 'common'
    self.save
  end

  def archived?
    status == 'archived'
  end
end
