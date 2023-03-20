class PostController < ApplicationController
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

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
