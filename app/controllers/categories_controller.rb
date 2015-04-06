class CategoriesController < ApplicationController

  before_filter :initialize_cart, only: [:show]
  def index
    @categories = Category.order("id DESC").page(params[:page]).per(25)
    render
  end

  def show
    @category = Category.find(params[:id])
    @categories = Category.all
    @pros = Product.where( :category_id => @category.id).order('id DESC')
    @sold_products = SoldProduct.where( :category_id => @category.id).order('id DESC')
    products = @pros + @sold_products
    @products = Kaminari.paginate_array(products).page(params[:page]).per(15)
    @paintings = @category.paintings
  end

  def new
    @category = Category.new(params[:category])
  end
  
  def create
    if is_admin?
      @category = Category.new(params[:category])
    end
    if
     @category.save
     redirect_to categories_path
    end
  end

  def edit
    @category = Category.find(params[:id])

  end

  def update
    @category = Category.find(params[:id])
    if @category.paintings.present?
    end
    @category.update_attributes(params[:category])
    redirect_to category_path(@category), :notice => "updated"
  end

  def delete

  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
  end
  
  #this is probly not necisary any more. in leu products should have a primary_painting_id
  #better for things to run through the update method.
  def update_featured_painting
    @painting = Painting.find(params[:painting_id])
      @cat = @painting.category
      @cat.update_attributes(featured_painting_id: @painting.id)
    if @cat.save
      redirect_to category_path(@cat)
    end
  end

  private

    def initialize_cart
      @user = current_user
      if @user.present?
        if @user.carts.present?
          @cart = @user.carts.last
        else
          @cart = @user.carts.new(params[:cart])
          @cart.save
        end
      end
  end

end
