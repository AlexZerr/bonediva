class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, null:false
      t.string :password, null:false
      t.string :email, default:"no email"
      t.string :username, null:false
      t.integer :age

      t.timestamps
    end
  end
end
