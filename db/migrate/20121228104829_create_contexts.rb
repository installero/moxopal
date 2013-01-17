class CreateContexts < ActiveRecord::Migration
  def self.up
    create_table :contexts do |t|
      t.string :title
      t.integer :max_minutes
      t.integer :position

      t.timestamps
    end
  end

  def self.down
    drop_table :contexts
  end
end
