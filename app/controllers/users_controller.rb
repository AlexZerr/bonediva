class UsersController < ApplicationController

  respond_to :html, :js
  # before_filter :ensure_authorized, only: [ :edit, :update, :delete ] 


  def index
    @user = User.find(params[:id])
    render
  end

  def show
    @user   = User.find(params[:id])
    @pictures = Picture.order('id desc').limit(20) 

  end


  def edit
    @user = User.find(params[:id])
    @picture = Picture.find(params[:id])

  end


  def update

  end


  def create
    @user = User.new(params[:user])
    if @user.save 
      redirect_to user_path(@user)
    
    end
  end


  def delete

  end


  def new
    @user = User.new(params[:user])
    
    

  end


  def get(id)
    User.find(params[:id])
  end





end
