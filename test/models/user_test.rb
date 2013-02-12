require "test_helper"
require "minitest/spec"

describe User do
  before do
   @user = User.new(name: "testie", email: "Test@example.com", password: "password", age: "22", username: "tessties" )
 end

 it " is a valid user" do
   assert @user.valid?, "this is a valid user"
 end
 it "creates a product as user" do
   @product = @user.products.new( name: "Productname", description: "Product description", price: "32", size: "8x10" )
   assert @product.valid?, "this product is valid"
 end

end
