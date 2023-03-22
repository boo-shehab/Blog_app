class PostController < ApplicationController
  load_and_authorize_resource
  def index
    @user = User.find(params[:user_id])
    @posts = Post.where(author_id: @user.id).includes(comment: [:author])
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.includes(comment: [:author]).find(params[:id])
  end

  def new
    @user = current_user
    @post = Post.new
  end

  def create
    post = Post.new(post_params)
    post.author_id = current_user.id
    if post.save
      redirect_to user_post_index_path(current_user.id)
    else
      redirect_to user_index_path, notice: 'Post creation failed'
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @post = @user.post.find(params[:id])
    @post.comments.destroy_all
    @post.likes.destroy_all
    if @post.destroy
      flash[:success] = 'Post deleted successfully'
      redirect_to user_path(@user)
    else
      flash.now[:error] = 'Error: Post could not be deleted'
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
