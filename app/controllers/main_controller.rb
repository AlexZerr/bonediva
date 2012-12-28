class MainController < ApplicationController

  respond_to :html, :js


  def index
    render
  end

  def about
    @picture = Picture.order( 'id desc' ).limit(20)
    render
  end

  def current_user
    if self.id == User.id
      current_user == true 
    end
   end
  
 end

