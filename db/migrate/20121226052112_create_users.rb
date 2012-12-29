class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :first_name
      t.string :last_name
      t.string :crypted_password
      t.string :password_salt
      t.string :persistence_token
      t.integer :picture_id
      t.integer :role
      t.integer :status

      t.timestamps
    end
  end
end
