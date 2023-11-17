require 'rails_helper'

RSpec.describe 'User', type: :feature do
  describe '#show users index' do
    before(:each) do
      @user = User.create(name: 'Juwairiyya Sadiq', bio: 'Undisputed Queen of DIY', photo_link: 'photo',
                          posts_counter: 0)
      @post4 = Post.create(title: 'Hello', text: 'How to make a table', author_id: @user.id, comments_counter: 0,
                           likes_counter: 0)
      @post3 = Post.create(title: 'Hi', text: 'How to stay healthy', author_id: @user.id, comments_counter: 0,
                           likes_counter: 0)
      @post2 = Post.create(title: 'Health recipe', text: 'Eat balance diet', author_id: @user.id, comments_counter: 0,
                           likes_counter: 0)
      @post1 = Post.create(title: 'Energy', text: 'How to set the solar system', author_id: @user.id,
                           comments_counter: 0, likes_counter: 0)
      before(:each) do
        @user = User.create(name: 'Juwairiyya Sadiq', bio: 'Undisputed Queen of DIY', photo_link: 'photo',
                            posts_counter: 0)
        @post4 = Post.create(title: 'Hello', text: 'How to make a table', author_id: @user.id, comments_counter: 0,
                             likes_counter: 0)
        @post3 = Post.create(title: 'Hi', text: 'How to stay healthy', author_id: @user.id, comments_counter: 0,
                             likes_counter: 0)
        @post2 = Post.create(title: 'Health recipe', text: 'Eat balance diet', author_id: @user.id, comments_counter: 0,
                             likes_counter: 0)
        @post1 = Post.create(title: 'Energy', text: 'How to set the solar system', author_id: @user.id,
                             comments_counter: 0, likes_counter: 0)

        @comment1 = Comment.create(text: 'How to be a con artist', user_id: @user.id, post_id: @post4.id)
        @comment2 = Comment.create(text: 'How to solve a crime', user_id: @user.id, post_id: @post4.id)
        @comment3 = Comment.create(text: 'Great post', user_id: @user.id, post_id: @post4.id)
        @comment4 = Comment.create(text: 'That is just awful', user_id: @user.id, post_id: @post4.id)
        @comment5 = Comment.create(text: 'Good post!', user_id: @user.id, post_id: @post4.id)
        @comment6 = Comment.create(text: 'Awesome stuff', user_id: @user.id, post_id: @post4.id)
        @comment1 = Comment.create(text: 'How to be a con artist', user_id: @user.id, post_id: @post4.id)
        @comment2 = Comment.create(text: 'How to solve a crime', user_id: @user.id, post_id: @post4.id)
        @comment3 = Comment.create(text: 'Great post', user_id: @user.id, post_id: @post4.id)
        @comment4 = Comment.create(text: 'That is just awful', user_id: @user.id, post_id: @post4.id)
        @comment5 = Comment.create(text: 'Good post!', user_id: @user.id, post_id: @post4.id)
        @comment6 = Comment.create(text: 'Awesome stuff', user_id: @user.id, post_id: @post4.id)

        visit user_path(@user)
      end
      visit user_path(@user)
    end

    it 'shows the username' do
      expect(page).to have_content(@user.name)
    end

    it 'should show users photo' do
      expect(page).to have_css("img[src='#{@user.photo_link}']")
    end

    it 'should display the number of posts' do
      expect(page).to have_content("Number of posts: #{@user.posts.count}")
    end

    it 'should display user bio' do
      expect(page).to have_content(@user.bio)
    end

    it 'shows the first three posts' do
      visit user_posts_path(@user)
      expect(page).to have_content('Hello')
      expect(page).to have_content('Hi')
      expect(page).to have_content('Health recipe')
    end

    it 'should display see all post link' do
      expect(page).to have_content('See all posts')
    end

    it 'See all posts should redirect to post index page' do
      see_all_posts_link = find('a', text: 'See all posts')
      see_all_posts_link.click
      expect(page).to have_current_path(user_posts_path(@user.id))
    end

    context 'When I click a user\'s post' do
      it 'redirects me to that post\'s show page' do
        visit user_path(@user)
        click_link('Health recipe')
        expect(page).to have_current_path(user_post_path(@user, @post2))
      end
    end
  end
end
