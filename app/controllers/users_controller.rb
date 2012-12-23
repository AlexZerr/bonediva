class UsersController < ApplicationController

  respond_to :html, :js
  before_filter :ensure_authorized, only: [ :edit, :update, :delete ] 


#Should I just have this enherrit from the MainController?


  def show
    @user     = User.find(params[:id])
    @pictures = Picture.order('id desc').limit(20) 

  end


  def edit
    @user = User.find(params[:id])
    @picture = Picture.find(params[:id])

  end


  def update

  end


  def create
    @error = []
    @user = User.new(params[:user])
    @error << "Field cannot be blank" if user_params.blank?
  end


  def delete

  end





end
