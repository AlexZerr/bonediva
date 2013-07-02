class BlogPostsController < ApplicationController

  before_filter :ensure_admin, only: [:new, :create]

  def new
    @user = User.where( email: "lisaluree@gmail.com" )
    @blog_post = @user.blog_posts.new(params[:blog_post])
  end

  def create
    @user = User.where( email: "lisaluree@gmail.com" )
    @blog_post = @user.blog_posts.new(params[:blog_post])
    if @blog_post.save
      redirect_to :back, notice: "#{@blog_post.title} has been created"
    end

  end

end
