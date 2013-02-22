class AddAttachmentItemToPictures < ActiveRecord::Migration
  def self.up
    change_table :pictures do |t|
      t.attachment :item
    end
  end

  def self.down
    drop_attached_file :pictures, :item
  end
end
