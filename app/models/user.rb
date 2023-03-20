class User < ApplicationRecord
  validates :name, presence: true
  validates :post_counter, presence: true, numericality: { greater_than_or_equal_to: 0 }

  has_many :like, foreign_key: 'author_id'
  has_many :post, foreign_key: 'author_id'
  has_many :comment, foreign_key: 'author_id'

  private

  def recent_three_posts
    post.order('created_at Desc').limit(3)
  end
end
