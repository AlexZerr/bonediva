class PicturesController < ApplicationController

  respond_to :html, :js

  
  
  
  def index
    @picture = Picture.find(params[:id])
      Picture.order("id desc")

  end


  def show
    @picture = Picture.find(params[:id])
      respond_to do |format|
      format.html
    end
  end


  def new
    @picture = Picture.new(params[:picture])

  end

  def create

    @picture = Picture.new(params[:picture])
    if @picture.attributes.blank?
     @picture.errors 
    elsif  @picture.save
      redirect_to picture_path(@picture)
    elsif
      redirect_to new_picture_path, :notice => "Could not create picture." 
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
end

