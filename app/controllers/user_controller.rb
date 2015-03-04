class UserController < ApplicationController
  def create
    @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
  end
end
