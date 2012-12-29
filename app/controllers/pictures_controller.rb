class PicturesController < ApplicationController

  respond_to :html, :js

  
  
  
  def index
    @picture = Picture.find(params[:id])
      Picture.order("id desc")

  end


  def show
    @picture = Picture.find(params[:id])

  end


  def new
    @picture = Picture.new(params[:picture])

  end

  def create
    @picture = Pictures.create(params[:picture])
    if @picture.save
      redirect_to picture_path(@picture)
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

