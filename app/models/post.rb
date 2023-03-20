class Post < ApplicationRecord
  validates :title, presence: true, length: { in: 0..250 }
  validates :comments_counter, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :likes_counter, presence: true, numericality: { greater_than_or_equal_to: 0 }

  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :comment
  has_many :like

  after_save :increase_posts_counter
  after_destroy :decrease_posts_counter

  private

  def increase_posts_counter
    author.update(post_counter: author.post_counter + 1)
  end

  def decrease_posts_counter
    author.update(post_counter: author.post_counter - 1)
  end

  def recent_five_comments
    comment.order('created_at Desc').limit(5)
  end
end
