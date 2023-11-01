class Post < ApplicationRecord
  validates :title, presence: true, length: { maximum: 250}
  validates :comments_counter, numericality: { only_interger: true, greater_than_or_equal_to: 0 }, allow_nil: true
  validates :likes_counter, numericality: { only_interger: true, greater_than_or_equal_to: 0 }, allow_nil: true

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
