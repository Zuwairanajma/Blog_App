require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'Comment model' do
    user1 = User.create(name: 'Juwairiyya Sadiq', photo_link: 'juwairiyya.jpeg',
                        bio: 'Digital Marketer, programmer and HR officer', posts_counter: 0)
    user2 = User.create(name: 'Aisha Walida', photo_link: 'aisha.jpeg',
                        bio: 'she loves to design henna and have fun', posts_counter: 0)
    post = Post.create(title: 'title', text: 'I dont have a title so I choose any title!',
                       author: user1, likes_counter: 3, comments_counter: 7)
    comment = Comment.create(post:, user: user2, text: 'serina is a good girl')

    it 'increase comments count on the post' do
      expect do
        comment.update_comment_count
        post.reload
      end.to change(post, :comments_counter).by(1)
    end
  end
end
