module ApplicationHelper

  def is_admin?
    current_user.present? && current_user.admin?
  end

  def current_user_path
    @user = current_user
    current_user_path = user_path(@user)
  end

  def update_featured_painting
    @painting = Painting.find(params[:id])
      @painting.category.update_attributes(featured_painting_id: @painting.id)
  end

  def complete_row

  end

end
