class MainController < ApplicationController

  respond_to :html, :js


  def index
   # @users = User.all
    @user = current_user
    @paintings = Painting.all
    @new_picture = Picture.new(params[:picture])
  end

  def about
     @new_picture = Picture.new(params[:picture])
     @pictures = Picture.order( 'id desc' ).limit(20)
     @user = current_user
    render
  end

 end

