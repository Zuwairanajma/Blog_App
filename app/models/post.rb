class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id', counter_cache: :posts_counter
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  after_save :increment_user_posts_counter

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  def increment_user_posts_counter
    author.increment!(:posts_counter)
  end
end
