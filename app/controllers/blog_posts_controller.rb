class BlogPostsController < ApplicationController

  before_filter :ensure_admin, only: [:new, :create]

  def new

  end

  def create

  end

end
