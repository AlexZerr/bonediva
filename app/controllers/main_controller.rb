class MainController < ApplicationController

  respond_to :html, :js

 # before_filter :ensure_admin, only_on: [:edit, :delete]
 # before_filter :ensure_authorized, only_on: [:create, :update]



  def index
    render
  end

  def about
    render
  end

end
