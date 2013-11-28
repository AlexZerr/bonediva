class CreateAuthentications < ActiveRecord::Migration
  def change
    create_table :authentications do |t|
      t.string :provider
      t.integer :user_id
      t.string :uid
      t.string :user_info

      t.timestamps
    end
  end
end
