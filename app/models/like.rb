class Like < ApplicationRecord
  belongs_to :post
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'

  after_save :increase_likes_counter
  after_destroy :decrease_likes_counter

  private

  def increase_likes_counter
    post.update(likes_counter: post.likes_counter + 1)
  end

  def decrease_likes_counter
    post.update(likes_counter: post.likes_counter - 1)
  end
end
