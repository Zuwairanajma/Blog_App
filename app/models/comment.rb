class Comment < ApplicationRecord
  belongs_to :user, class_name: 'User'
  belongs_to :post, counter_cache: true, optional: true

  private

  def updte_comment_count
    post.increment!(:comments_count)
  end
end
