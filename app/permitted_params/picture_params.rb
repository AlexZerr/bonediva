PictureParams = Struct.new(:user, :params) do

  def permitted
    params.require(:picture).permit(*picture_attributes)
  end

private

  def picture_attributes
    [
      :title, :description, :image
    ]
  end

end
