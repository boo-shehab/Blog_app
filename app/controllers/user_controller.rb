class UserController < ApplicationController
  def index
    @user = current_user
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @posts = Post.where(author_id: params[:id])
  end
end
