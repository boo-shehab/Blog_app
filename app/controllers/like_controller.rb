class LikeController < ApplicationController
  def create
    like = Like.new(author_id: current_user.id, post_id: Post.find(params[:post_id]).id)
    if like.save
      flash[:success] = 'New post successfully added!'
      redirect_to user_post_path(params[:user_id], params[:post_id])
    else
      redirect_to user_index_path, notice: 'Post creation failed'
    end
  end
end
