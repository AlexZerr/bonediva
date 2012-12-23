class MainController < ApplicationController

  respond_to :html, :js

 # before_filter :ensure_admin, only_on: [:edit, :delete]
 # before_filter :ensure_authorized, only_on: [:create, :update]



  def index
   # @pictures = Picture.find.(:all, :order => date) 
   # @user     = User.find(:all, :order => 'id DESC') 
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
      end
  end

        #not sure if I really want to have a user setup...
        #I think the it may get cluttered if there is alot of user interactive stuff.
        #However, for the start and the sake of learning, I am going to put that stuff
        #in there.
        #Maby we could have something where only artist friends of hers can have a user profile.


  def update
    @user = User.find(params[:id])
    if User.update(@user.id, user_params)
      #redirect_to @user, notice: { "was succesfully updated" } 
    end
    @picture = Picture.find(params[:id])
    if Picture.update(@picture.id, picture_params)
     # redirect_to @picture, notice: { " was succesfully updated" }
    end
  end

  def delete
   # if @user.delete
    #  notice: { "was succesfully deleted." } 
   # end
  end

  def destroy

  end

  def show
    @user = User.find(params[:id])
    @comments = @user.comments.order('id DESC').limit(20)
    @pictures = picture.find(params[:id])
  end
 
  def about
    #@picture = Picture.find(params[:id])

  end

end
