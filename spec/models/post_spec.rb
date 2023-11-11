require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user) do
    User.create(
      name: 'Me myself',
      photo_link: 'https://memyself.com/photos/memyself',
      bio: 'talk about me',
      posts_counter: 10
    )
  end

  let(:post) do
    Post.create(
      author: user,
      title: 'Post one',
      text: 'This is my first post'
    )
  end

  describe 'associations' do
    it { is_expected.to belong_to(:author).class_name('User').counter_cache(:posts_counter) }
    it { is_expected.to have_many(:likes).dependent(:destroy) }
    it { is_expected.to have_many(:comments).dependent(:destroy) }
  end

  describe 'validations' do
    it 'is valid with valid attributes' do
      post = Post.new(author: user, title: 'Post one', text: 'This is my firt post', likes_counter: 0,
                      comments_counter: 0)
      expect(post).to be_valid
    end

    it 'is not valid without a title' do
      post.title = ''
      expect(post).to_not be_valid
    end

    it 'is not valid with a title exceeding 250 characters' do
      post.title = 'A' * 251
      expect(post).to_not be_valid
    end

    it 'is not valid with a non-integer comments counter' do
      post.comments_counter = 'not-an-integer'
      expect(post).to_not be_valid
    end

    it 'is not valid with a non-integer likes counter' do
      post.likes_counter = 'not-an-integer'
      expect(post).to_not be_valid
    end
  end

  describe 'custom methods in Post' do
    it 'increments user posts counter' do
      expect { post.increment_user_posts_counter }.to change(user, :posts_counter).by(1)
    end
    it 'checks most recent 5 comments' do
      expect(post.recent_comments).to eq(post.comments.last(5))
      puts post.comments.last(5)
    end
  end
end
