class AddAttachmentPictureToContexts < ActiveRecord::Migration
  def self.up
    change_table :contexts do |t|
      t.attachment :picture
    end
  end

  def self.down
    drop_attached_file :contexts, :picture
  end
end
