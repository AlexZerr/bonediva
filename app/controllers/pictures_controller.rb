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


  def fab_five
    @picture = User.picture(params[:id]).order("id desc").limit(5)
  end
end
