class PrintsController < ApplicationController
  respond_to :html, :js, :json

  before_filter :find_product

  def new
    @print = @product.prints.new
  end

  def create
    @print = @product.prints.new(params[:print])
    @print.user_id = current_user.id
    if @print.save
      redirect_to :back, notice: "Your Print has been created."
    else
      redirec_to :back, notice: "#{@print.errors.full_messages}"
    end
  end

  def update

  end

  def destroy

  end

  private

  def find_product
    @product = Product.find(params[:product_id])
  end

end
