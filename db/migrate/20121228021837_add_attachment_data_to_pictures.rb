class AddAttachmentDataToPictures < ActiveRecord::Migration
  def self.up
    change_table :pictures do |t|
      t.attachment :data
    end
  end

  def self.down
    drop_attached_file :pictures, :data
  end
end
