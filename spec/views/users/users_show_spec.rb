require 'rails_helper'

RSpec.describe 'User', type: :feature do
  describe 'content of user index page' do
    let(:user1) { User.create(name: 'Juwairiyya', photo_link: 'photo_url', bio: 'text', posts_counter: 0) }

    before(:each) do
      user1.posts.create(title: 'Post Title', text: 'Post Content')
      visit "/users/#{user1.id}"
    end

    it 'shows the username' do
      expect(page).to have_content(user1.name)
    end

    it 'should show users photo' do
      expect(page).to have_css("img[src='#{user1.photo_link}']")
    end

    it 'should display user name' do
      expect(page).to have_content(user1.name)
    end

    it 'should display the number of posts' do
      expect(page).to have_content("Number of posts: #{user1.posts.count}")
    end

    it 'should display user bio' do
      expect(page).to have_content(user1.bio)
    end

    it 'should display see all post link' do
      expect(page).to have_content('See all posts')
    end

    it 'See all posts should redirect to post index page' do
      see_all_posts_link = find('a', text: 'See all posts')
      see_all_posts_link.click
      expect(page).to have_current_path(user_posts_path(user1.id))
    end
  end
end
