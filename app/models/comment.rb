class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  after_create :update_comment_count

  def update_comment_count
    post.increment!(:comments_counter)
  end
end
