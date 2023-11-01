class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post, counter_cache: :comments_counter, optional: true
  has_many :likes, dependent: :destroy

  after_save :update_comment_count

  def update_comment_count
    post.increment!(:comments_counter)
  end
end
