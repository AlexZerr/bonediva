class PrintCategoriesController < ApplicationController

  def new
    @print_categories = PrintCategory.all
    @print = Print.new
  end

  def create

  end

  def show
    @print_category = PrintCategory.find(params[:id])
  end

  def edit
    @print = Print.new
  end

  def update

  end

end

