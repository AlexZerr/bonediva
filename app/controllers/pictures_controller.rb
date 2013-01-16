
require 'carrierwave/processing/mini_magick'
class PicturesController < ApplicationController

  respond_to :html, :js

  
  
  
  def index
    @picture = Picture.find(params[:id])
      Picture.order("id desc")
  end


  def show
    @picture = Picture.find(params[:id])
    @users = User.all
    @user = current_user
      respond_to do |format|
      format.html
    end
  end


  def new
    @picture = Picture.new 
    @user = current_user
    @pictures = current_user.pictures
    respond_with @pictures.order("id desc").limit(5)
    @users = User.all
  end

  def create
    @picture = current_user.pictures.new(params[:picture])
    #@picture.title = params[:picture][:title]
    #@picture.description = params[:picture][:description]
    #uploader = ImagesUploader.new
    #uploader.store!(@picture)
   # uploader.retrieve_from_store!(params[:pic])
    #@picture.image = uploader.to_s
    @picture.save
    respond_with @picture
  end


  def edit

  end


  def delete

  end


  def destroy

  end
  
  
  def update

  end

  private

  def picture_params
    params.require(:picture).permit(:title, :description, :image)
  end

  def upload_method
    uploader = ImagesUploader.new
    uploader.store!(@picture.image)
    return uploader.to_s
  end

end

