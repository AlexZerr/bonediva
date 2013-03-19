class MainController < ApplicationController

  respond_to :html, :js


  def index
   # @users = User.all
    if current_user.present?
      @user = current_user 
    end
    #@paintings = Painting.all
    @paintings = Painting.all(:limit => 4, :order => 'created_at DESC')
    @new_picture = Picture.new(params[:picture])
  end

  def about
     @new_picture = Picture.new(params[:picture])
     @pictures = Picture.order( 'id desc' ).limit(20)
     @user = current_user
    render
  end

 end

