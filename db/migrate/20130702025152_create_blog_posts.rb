class CreateBlogPosts < ActiveRecord::Migration
  def change
    create_table :blog_posts do |t|
      t.string :title, null:false
      t.string :body, null: false
      t.integer :painting_id

      t.timestamps
    end
  end
end
