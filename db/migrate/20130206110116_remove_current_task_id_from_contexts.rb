class RemoveCurrentTaskIdFromContexts < ActiveRecord::Migration
  def self.up
    remove_column :contexts, :current_task_id
    add_column :contexts, :active_task_id, :integer
  end

  def self.down
    add_column :contexts, :current_task_id, :integer
    remove_column :contexts, :active_task_id
  end
end
