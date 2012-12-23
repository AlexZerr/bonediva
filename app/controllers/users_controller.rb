class UsersController < ApplicationController

  respond_to :html, :js
  before_filter :ensure_authorized, only: [ :edit, :update, :delete ] 





  def show

  end


  def edit

  end


  def update

  end


  def create

  end


  def delete

  end





end
