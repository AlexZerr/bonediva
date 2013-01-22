class AddUserLinkToUsers < ActiveRecord::Migration
  def change
    add_column :users, :user_link, :string
  end
end
