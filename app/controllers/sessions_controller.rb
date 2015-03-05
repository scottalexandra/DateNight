class SessionsController < ApplicationController
  def create
    @user = User.find_or_create_from_auth(auth)
    if @user
      session[:user_id] = @user.id
      redirect_to :back
    else
      flash[:error] = "Invalid Login"
      redirect_to events_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  private

  def auth
    request.env['omniauth.auth']
  end
end
