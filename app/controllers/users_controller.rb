class UsersController < ApplicationController

  respond_to :html, :js
  # before_filter :ensure_authorized, only: [ :edit, :update, :delete ] 




  def show
   # @user   = User.find
    @pictures = Picture.order('id desc').limit(20) 

  end


  def edit
    @user = User.find(params[:id])
    @picture = Picture.find(params[:id])

  end


  def update

  end


  def create
    @user = User.create(params[:user])
    if @user.save 
      redirect_to :action => 'show'
    
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
