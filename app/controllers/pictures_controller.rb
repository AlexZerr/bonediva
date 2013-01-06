class PicturesController < ApplicationController

  respond_to :html, :js

  
  
  
  def index
    @picture = Picture.find(params[:id])
      Picture.order("id desc")

  end


  def show
    @picture = Picture.find(params[:id])
    #@new_picture = Picture.new(params[:picture])

  end


  def new
    @picture = Picture.new(params[:picture])

  end

  def create

    @picture = Picture.new(params.require(:picture).permit([:title, :description, :image]))
    if @picture.save
      redirect_to picture_path(@picture)
    else
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

