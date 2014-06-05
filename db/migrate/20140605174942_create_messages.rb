class CreateMessages < ActiveRecord::Migration
  def up
    create_table :messages do |t|
      t.string :title, default: "no title"
      t.text :body, null: false
      t.string :user_email, null: false
      t.integer :user_id, null: false
      t.string :deleted_at

        t.timestamps
    end
  end

  def down
    drop_table :messages
  end
end
