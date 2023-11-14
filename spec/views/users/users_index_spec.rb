require 'rails_helper'

RSpec.describe 'users', type: :feature do
  let(:user1) { User.create(name: 'Juwairiyya', photo_link: 'photo_url', bio: 'text', posts_counter: 0) }
  let(:user2) { User.create(name: 'Aisha', photo_link: 'photo_url_2', bio: 'Rabbit officer', posts_counter: 0) }
  let(:user3) { User.create(name: 'Nick', photo_link: 'photo_url_3', bio: 'Rabbit officer', posts_counter: 0) }
  let(:post1) do
    Post.create(author_id: user1.id, title: 'Juwairiyya', text: 'How to make a table',
                comments_counter: 0, likes_counter: 0)
  end

  before(:each) do
    user1
    user2
    user3
    visit users_path
  end

  it 'shows all users' do
    expect(page).to have_content('Juwairiyya')
    expect(page).to have_content('Aisha')
  end
  it 'display the photos for each user' do
    expect(page).to have_css("img[src*='photo_url']")
    expect(page).to have_css("img[src*='photo_url_2']")
  end
  it 'Display number of post' do
    expect(page).to have_content('Number of posts: 0')
  end

  it 'display number of posts for each user' do
    expect(page).to have_content("Number of posts: #{user1.posts.count}")
  end
  it 'Redirect to that user\'s show page on clicking a user' do
    click_link 'Nick'
    expect(page).to have_current_path(user_path(user3.id))
  end
end
