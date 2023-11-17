require 'rails_helper'

RSpec.describe 'User', type: :feature do
  before :each do
    @user = User.create(name: 'Juwairiyya Sadiq', photo_link: 'Photo',
                        bio: 'Undisputed Queen of DIY', posts_counter: 0)
    @first_post = Post.create(author: @user, title: 'Juwairiyya', text: 'How to make a table', comments_counter: 0,
                              likes_counter: 0)
    @comment = Comment.create(post: @first_post, user: @user, text: 'Great post!')
  end

  it 'shows post title' do
    visit "/users/#{@user.id}/posts/#{@first_post.id}"
    expect(page).to have_content('Juwairiyya')
  end

  it 'shows post author' do
    user_name = User.find(@user.id).name
    visit "/users/#{@user.id}/posts/#{@first_post.id}"
    expect(page).to have_content(user_name)
  end

  it 'shows number of likes and comments' do
    visit "/users/#{@user.id}/posts/#{@first_post.id}"
    user_post = @user.posts.find_by(id: @first_post.id)
    expect(page).to have_content(user_post.comments.count)
    expect(page).to have_content(user_post.likes.count)
  end

  it 'shows the post text' do
    visit "/users/#{@user.id}/posts/#{@first_post.id}"
    expect(page).to have_content(@first_post.text)
  end
  it 'shows the username of all authors' do
    author_name = User.find(@user.id).name
    visit "/users/#{@user.id}/posts/#{@first_post.id}"
    expect(page).to have_content(author_name)
  end

  it 'shows the comment left by a author' do
    visit "/users/#{@user.id}/posts/#{@first_post.id}"
    expect(page).to have_content(@comment.text)
  end
end
