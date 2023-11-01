class User < ApplicationRecord
  validates :name, presence: true
  validates :posts_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, allow_nil: true

  has_many :posts, foreign_key: 'author_id', dependent: :destroy, counter_cache: true
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  def most_recent_posts
    posts.order(created_at: :desc).limit(3)
  end
end
