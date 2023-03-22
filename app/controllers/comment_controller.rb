class CommentController < ApplicationController
  def new
    @post = Post.find(params[:post_id])
    @user = User.find(params[:user_id])
    @comment = Comment.new
  end

  def create
    comment = Comment.new(comment_params)
    comment.author_id = current_user.id
    comment.post_id = params[:post_id]
    if comment.save
      redirect_to user_post_path(user_id: current_user.id, id: params[:post_id])
    else
      redirect_to user_index_path, notice: 'Post creation failed'
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    if @comment.destroy
      flash[:success] = 'Comment deleted successfully'
      redirect_to user_post_path(@user, @post)
    else
      flash.now[:error] = 'Error: Comment could not be deleted'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
