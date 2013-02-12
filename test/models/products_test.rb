
require "test_helper"
require "minitest/spec"
require "capybara/rails"

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
    assert @painting.valid?, "valid product painting"
  end
end
