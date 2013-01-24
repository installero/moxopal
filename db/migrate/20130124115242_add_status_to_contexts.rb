class AddStatusToContexts < ActiveRecord::Migration
  def self.up
    add_column :contexts, :status, :string
    add_column :contexts, :current_task_id, :integer
  end

  def self.down
    remove_column :contexts, :current_task_id
    remove_column :contexts, :status
  end
end
