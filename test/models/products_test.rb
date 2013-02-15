
require "test_helper"
require "minitest/spec"
require "capybara/rails"
require "minitest/pride"

describe Product do
  
  before do
   @user = User.new(name: "testise", email: "Test2@example.com", password: "password", age: "22", username: "tessties2" )
   @product = @user.products.new( name: "Productname1", description: "Product description2", price: "32", size: "8x10" )
  end

  after do
    @user.destroy
    @product.destroy
  end

  it "makes sure product has painting" do
    @painting = @product.paintings.new( image: ImagesUploader )
    @painting.paintable_id.must_be_same_as @product.id
    @painting.paintable_type.must_equal "Product"
    @painting.user_id.must_be_same_as @user.id && @product.user_id
  end
end
