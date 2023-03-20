class Like < ApplicationRecord
  belongs_to :post
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'

  after_save :updates_likes_counter

  private

  def updates_likes_counter
    post.update(likes_counter: post.likes_counter + 1)
  end
end
