class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  after_create :increment_likes_counter

  def increment_likes_counter
    post.increment!(:likes_counter)
  end
end
