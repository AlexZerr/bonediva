class CreateBonedivaScaffolds < ActiveRecord::Migration
  def change
    create_table :bonediva_scaffolds do |t|
      t.string :title
      t.text :description
      t.string :image

      t.timestamps
    end
  end
end
