class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'

  after_save :updates_comments_counter

  private

  def updates_comments_counter
    post.increment!(:comments_counter)
  end
end
