class SessionsController < ApplicationController
  def create
    user = User.find_or_create_from_auth(auth)
    if user
      session[:user_id] = user.id
      flash[:notice] = "Successfully Logged In"
      redirect_to user_path(user.id)
    else
      flash[:error] = "Invalid Login"
      redirect_to root_path
    end
  end

  private

  def auth
    request.env['omniauth.auth']
  end
end
