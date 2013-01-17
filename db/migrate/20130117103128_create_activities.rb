class CreateActivities < ActiveRecord::Migration
  def self.up
    create_table :activities do |t|
      t.integer :task_id
      t.integer :context_id
      t.boolean :accepted

      t.timestamps
    end
  end

  def self.down
    drop_table :activities
  end
end
