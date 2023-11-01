class User < ApplicationRecord
  has_many :posts, foreign_key: 'author_id', dependent: :destroy, counter_cache: true
  has_many :comments, foreign_key: 'user_id', dependent: :destroy
  has_many :likes, foreign_key: 'user_id', dependent: :destroy

  def most_recent_posts
    posts.order(created_at: :desc).limit(3)
  end
end
