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
    #params[:picture][:image]
    @picture = current_user.pictures.new(picture_params)
    @picture.title = params[:picture][:title]
    @picture.description = params[:picture][:description]
    uploader = ImagesUploader.new
    uploader.store!(params[:picture][:pic])
    @picture.image = uploader.to_s
    @picture.save
    respond_with @picture
   # uploader.retrieve_from_store!(@picture.image)
    
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

end

