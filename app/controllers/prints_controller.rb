class PrintsController < ApplicationController
  respond_to :html, :js, :json

  def new

  end

  def create
    @print = Print.new
    @print.save

  end

  def update

  end

  def destroy

  end

end
