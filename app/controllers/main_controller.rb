class MainController < ApplicationController

  respond_to :html, :js


  def index
    @users = User.all
    #@user = User.find(params[:id])
    render
  end

  def about
     @picture = Picture.order( 'id desc' ).limit(20)
    render
  end

 end

