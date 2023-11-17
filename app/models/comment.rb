class Comment < ApplicationRecord
  belongs_to :user, class_name: 'User'
  belongs_to :post, class_name: 'Post'
  has_many :likes, dependent: :destroy

  after_create :update_comment_count

  def update_comment_count
    post.increment!(:comments_counter)
  end
end
