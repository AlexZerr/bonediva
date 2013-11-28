class AuthenticationController < ApplicationController

  def index
    @authentications = current_user.authentications if current_user
  end

  def create
    auth = request.env["omniauth.auth"]
    current_user.authentications.find_or_create_by_provider_and_uid(auth['provider'], auth['uid'])
    redirect_to authentications_path, notice: "Authentication Successful"
  end

  def destroy
    @authentication = current_user.authentications.find(params[:id])
    @authentication.destroy
    redirect_to authentications_url, notice: "Successfully destroyed authentication."
  end
end
