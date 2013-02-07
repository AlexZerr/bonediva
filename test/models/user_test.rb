require "minitest_helper"

describe User do
 it " is a valid user" do
   @user = User.new(name: "testie", email: "Test@example.com", password: "password", age: "22", username: "tessties" )
   assert @user.valid?, "this is a valid user"
 end

end
