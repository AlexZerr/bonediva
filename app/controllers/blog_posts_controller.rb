class BlogPostsController < ApplicationController

  respond_to :html, :js, :json
  before_filter :ensure_admin, only: [:new, :create]
  before_filter :find_blog_post, except: [:new, :create, :index]

  def index
    @blog_posts = BlogPost.all
  end

  def new
      @user = current_user
    @blog_post = BlogPost.new(params[:blog_post])
  end

  def create
    if current_user.email == "bonediva@gmail.com"
    @user = User.find_by_email( "bonediva@gmail.com")
    elsif current_user.email.in?( "Thwarts@gmail.com") 
    @user = User.find_by_email( "Thwarts@gmail.com")
    end
    @blog_post = @user.blog_posts.new(params[:blog_post])
    @blog_post.user_id = @user.id
    if @blog_post.save
      redirect_to @blog_post, notice: "#{@blog_post.title} has been created"
    end

  end

  def show
    @blog_post = BlogPost.find(params[:id])
  end

  def edit
    render
  end
  
  def update
    @blog_post.update_attributes(params[:blog_post])
    if @blog_post.save
      respond_with @blog_post, notice: "Post updated Successfully" 
    end
  end

  def delete

  end

  def destroy
    if @blog_post.destroy
      redirect_to :back, notice: "#{@blog_post.title} was deleted"
    end
  end

  private

  def find_blog_post
    @blog_post = BlogPost.find(params[:id])
  end
end
