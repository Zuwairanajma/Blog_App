class Like < ApplicationRecord
  belongs_to :user, class_name: 'User'
  belongs_to :post, counter_cache: true

  private

  def increment_user_likes_counter
    post.increment!(:likes_counter)
  end
end
