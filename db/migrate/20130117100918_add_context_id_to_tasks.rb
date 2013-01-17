class AddContextIdToTasks < ActiveRecord::Migration
  def self.up
    add_column :tasks, :context_id, :integer
  end

  def self.down
    remove_column :tasks, :context_id
  end
end
