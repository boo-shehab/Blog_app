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

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
