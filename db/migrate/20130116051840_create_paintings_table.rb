class CreatePaintingsTable < ActiveRecord::Migration
  def up
    create_table :paintings do |t|
      t.string :title
      t.string :image
      t.text   :discription
    end
  end

  def down
    drop_table :paintings
  end
end
