class MainController < ApplicationController

  respond_to :html, :js


  def index
    @users = User.all
    @user = current_user
    @picture = Picture.new(params[:picture])
  end

  def about
     @picture = Picture.order( 'id desc' ).limit(20)
    render
  end

 end

