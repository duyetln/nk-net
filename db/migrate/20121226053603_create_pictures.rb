class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.string :description     
      t.integer :width
      t.integer :height
      t.integer :user_id
      
      t.timestamps
    end
  end
end
