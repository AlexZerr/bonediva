class BlogPostsController < ApplicationController

  before_filter :ensure_admin, only: [:new, :create]

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
end
