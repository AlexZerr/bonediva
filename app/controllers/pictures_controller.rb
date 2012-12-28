class PicturesController < ApplicationController

  respond_to :html, :js

  
  
  
  def index
    @picture = Picture.order("id desc")

  end


  def show
    @picture = @user.picture.find(params[:id])

  end


  def new
    @picture = Picture.new
      respond_with @picture
   end

  end


  def edit

  end


  def delete

  end


  def destroy

  end
  
  
  def update

  end

