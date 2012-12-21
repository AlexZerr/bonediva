class MainController < ApplicationController
  respond_to :html, :js

  def index
    @pictures = Picture.find.(:all, :order => date) 
    @user     = User.find(:all, :order => 'id DESC') 

  end

  def edit
    @pictures = Picture.find(params[:id])
    @user     = User.find(params[:id])
  end

  def create

    @user  = User.new(params[:user])
      if @user.save
            redirect_to @user
      else
        render action: "new"

  def update
    @user = User.find(params[:id])
    if User.update(@user.id, user_params)
      redirect_to @user, notice: { "#{@user.name} was succesfully updated" } 
    end

  end

  def delete

  end

  def destroy

  end

  def show
    @user = User.find(params[:id])
    @comments = @user.comments.order('id DESC').limit(20)
    @pictures = picture.find(params[:id])

  end

end
