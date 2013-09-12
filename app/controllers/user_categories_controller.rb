class UserCategoriesController < ApplicationController
  respond_to :html, :js

  before_filter :find_user
  
  def new
    @user = current_user
    @user_cat = @user.user_categories.new
  end

  def create
    @user = current_user
    @user_cat = @user.user_categories.new(params[:user_category])
    @user_cat.user_id = @user.id
    if @user_cat.save
      redirect_to user_path(@user), notice: "Category Created!"
    end
  end

  def edit

  end

  def update
    @user_cat = @user.user_categories.find(params[:user_category_id])
    @user_cat.update_attributes(params[:user_category])
    if @user_cat.save
      redirect_to user_path(@user), notice: "Category Updated!"
    end
  end

  def destroy
    @user_cat = @user.user_categories.find(params[:id])
    @user_cat.destroy 
  end

  private

  def find_user
    @user = User.find(params[:user_id])
  end
end
