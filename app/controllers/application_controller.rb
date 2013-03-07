class ApplicationController < ActionController::Base
  protect_from_forgery


  def is_admin?
    current_user.present? && current_user.admin?
  end

  def ensure_admin
    return unauthorized! unless current_user.present? && current_user.admin?# &&
  end
 # def set_current_user 
  #  Authorization.current_user = current_user
 # end
    def update_featured_painting
    @painting = Painting.find(params[:id])
      @painting.category.featured_painting_id = @painting.id
      @painting.save
    end

    helper_method :update_featured_painting

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end


  helper_method :current_user

end
