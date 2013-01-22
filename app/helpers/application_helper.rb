module ApplicationHelper

  def is_admin?
    current_user.present? && current_user.admin?
  end

  def current_user_path
    @user = current_user
    current_user_path = user_path(@user)
  end

end
