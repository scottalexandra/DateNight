class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  before_action :set_planner

  def set_planner
    @planner = Planner.new(session[:planner])
  end

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user

  def authorize!
    redirect_to root_path unless current_user
  end

end
