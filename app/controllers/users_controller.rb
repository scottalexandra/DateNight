class UsersController < ApplicationController
  def create
    @user = User.find(params[:id])
  end

  def show
  
  end
end
