class UserController < ApplicationController
  def index
    @user = User.first
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end
end
