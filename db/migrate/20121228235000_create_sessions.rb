class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.string :session_id
      t.text :data

      t.timestamps
    end
    
    add_index :sessions, :session_id
    add_index :sessions, :updated_at
  end
end
