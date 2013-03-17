class CreateTableAvatars < ActiveRecord::Migration
  def up
    create_table :avatars do |t|
      t.string :image, null: false
      t.string :name
    end
  end

  def down
    drop_table :avatars
  end

end
