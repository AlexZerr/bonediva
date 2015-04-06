class MainController < ApplicationController

  respond_to :html, :js


  def index
   # @users = User.all
    if current_user.present?
      @user = current_user 
    end
    #@paintings = Painting.all
    @pros = Product.all(:limit => 50, :order => 'id DESC')
    @sold_products = SoldProduct.all(:limit => 50, :order => 'id DESC')
    products = @pros + @sold_products
    @products = Kaminari.paginate_array(products).page(params[:page]).per(24)
    @new_picture = Picture.new(params[:picture])
    @blog_posts = BlogPost.where( "created_at >= ? AND created_at <= ?", 1.month.ago, Time.now).order( "created_at DESC" ) 
    @bone_user = User.find_by_email("bonediva@gmail.com")
    if @bone_user.paintings.present?
      if @bone_user.paintings.last.paintable_type == "Product"
        @new_painting = @bone_user.paintings.where(primary_painting: true).last
      elsif @bone_user.paintings.last.paintable_type == "Category"
        @new_painting = @bone_user.paintings.where(paintable_type: "Category").last
      elsif @bone_user.paintings.last.paintable_type == 'SoldProduct'
        @new_painting = @bone_user.paintings.where(primary_painting: true).where("paintable_type <> ?", "SoldProduct").last
      end
    end
    @categories = Category.all
  end

  def about
     @new_picture = Picture.new(params[:picture])
     @pictures = Picture.order( 'id desc' ).limit(20)
     @user = current_user
    render
  end


 end

