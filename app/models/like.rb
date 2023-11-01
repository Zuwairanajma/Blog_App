class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post, counter_cache: :likes_counter

  after_save :increment_likes_counter

  def increment_likes_counter
    post.increment!(:likes_counter)
  end
end
