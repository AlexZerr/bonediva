
require "minitest_helper"
require "minitest/spec"
require "capybara/rails"
require "minitest/pride"

describe Category do

  before do
    @category = Category.new( name: "Category Test", description: "testing categories", id: 2 )
    @product = Product.new( name: "Productname2", description: "Product description2", price: "32", size: "8x10", category_id: "#{ @category.id }"  )
    @categories = Category.all
  end

  after do
    @category.destroy
    @product.destroy
  end

  it "makes sure a category is valid" do
    assert @category.valid?
    @category.name.must_equal "Category Test"
  end

  it "makes sure a product has category_id " do
    @product.category_id.must_be_same_as @category.id
  end

  it "checks category id is same as product cat_id" do
    @category.id.must_be_same_as @product.category_id
  end
    




end
