class DeleteBonedivaScaffolds < ActiveRecord::Migration
  def up
    drop_table :bonediva_scaffolds
  end

  def down
    create_table :bonediva_scaffolds do |t|
      t.string :title
      t.text :description
      t.string :image

      t.timestamps
    end
  end
end
