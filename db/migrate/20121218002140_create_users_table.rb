class CreateUsersTable < ActiveRecord::Migration
  def up
    create_table :users do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.sting  :user_name, null: false
      t.string :location
      t.timestamps
    end
  end

  def down
    drop_table :users
  end
end
