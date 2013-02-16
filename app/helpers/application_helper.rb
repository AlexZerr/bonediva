module ApplicationHelper

  def is_admin?
    current_user.present? && current_user.admin?
  end

  def current_user_path
    @user = current_user
    current_user_path = user_path(@user)
  end

  #def select_category_paiting
   # @painting = Painting.find(params[:id])
    #if @painting.select? 
     # @painting.update_attributes[:painting][:category_painting_id]

    #end
  end

end
