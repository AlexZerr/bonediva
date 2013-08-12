class BlogPostsController < ApplicationController

  respond_to :html, :js, :json
  before_filter :ensure_admin, only: [:new, :create]
  before_filter :find_blog_post, except: [:new, :create, :index]

  def index
    @blog_posts = BlogPost.all
  end

  def new
    @user = current_user if current_user.email = "lisaluree@gmail.com"
    @blog_post = BlogPost.new(params[:blog_post])
  end

  def create
    #bah User.where(email: "lisaluree@gmail.com") not working
    @user = User.find(11)
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
      respond_with @blog_post, notice: "Post Created Successfully" 
    end
  end

  def delete

  end

  def destroy
    if @blog_post.destroy
      respond_with @blog_post
    end
  end

  private

  def find_blog_post
    @blog_post = BlogPost.find(params[:id])
  end
end
