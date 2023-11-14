require 'rails_helper'

RSpec.describe 'posts', type: :feature do
  describe '#index' do
    before(:each) do
      @user = User.create(name: 'Juwairiyya Sadiq', bio: 'Undisputed Queen of DIY', photo_link: 'photo', posts_counter: 0)
      @post4 = Post.create(title: 'Hello', text: 'How to make a table', author_id: @user.id, comments_counter: 0, likes_counter: 0)
      @comment1 = Comment.create(text: 'How to be a con artist', user_id: @user.id, post_id: @post4.id)
      @comment2 = Comment.create(text: 'How to solve a crime', user_id: @user.id, post_id: @post4.id)
      @comment3 = Comment.create(text: 'Great post', user_id: @user.id, post_id: @post4.id)
      @comment4 = Comment.create(text: 'That is just awful', user_id: @user.id, post_id: @post4.id)
      @comment5 = Comment.create(text: 'Good post!', user_id: @user.id, post_id: @post4.id)
      @comment6 = Comment.create(text: 'Awesome stuff', user_id: @user.id, post_id: @post4.id)

      visit user_posts_path(@user)
    end
    it 'displays user information' do
      expect(page).to have_css('img')
      expect(page).to have_content('Juwairiyya')
      expect(page).to have_content('Number of posts: 1')
    end
   
end
