class ChangeBodyOnBlogPosts < ActiveRecord::Migration
  def up
    change_column :blog_posts, :body, :text, null: false
  end

  def down
    change_column :blog_posts, :body, :string, null: false
  end
end
