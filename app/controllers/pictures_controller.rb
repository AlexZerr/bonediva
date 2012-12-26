class PicturesController < ApplicationController

  respond_to :html, :js

  
  
  
  def index
    @picture = Picture.order("id desc")

  end


  def show
    @picture = Picture.find(params[:id])

  end


  def new
    @picture = Picture.new(params[:picture])
    if Picture.save
      redirect_to ('/')
      flash: ( "You're picture has been saved" )
    end
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
