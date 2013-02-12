require "test_helper"
require "minitest/spec"
require "capybara/rails"
require "minitest/pride"

describe User do
  before do
   @user = User.new(name: "testie", email: "Test@example.com", password: "password", age: "22", username: "tessties" )
   @product = @user.products.new( name: "Productname", description: "Product description", price: "32", size: "8x10" )
 end

  after do
    @user.destroy
    @product.destroy
  end

 it " is a valid user" do
   assert @user.valid?, "this is a valid user"
 end
 it "creates a product as user" do
   assert @product.valid?, "this product is valid"
   @product.user_id.must_be_same_as @user.id
 end
end
