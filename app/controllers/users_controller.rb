class UsersController < ApplicationController
  def create
    @user = User.find(params[:id])
  end

  def show
    @itineraries = current_user.itineraries.order("created_at DESC")
  end
end
