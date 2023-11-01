# require 'rails_helper'
# require 'factory_bot_rails'
# require 'shoulda/matchers'

# RSpec.describe User, type: :model do
#   subject(:user) { described_class.new(name: 'John', posts_counter: 2) }

#   describe 'validations' do
#     it { should validate_presence_of(:name) }
#     it { should validate_numericality_of(:posts_counter).only_integer.is_greater_than_or_equal_to(0).allow_nil }
#   end

#   describe 'associations' do
#     it { is_expected.to have_many(:posts).dependent(:destroy).with_foreign_key('author_id').with_counter_cache(:posts) }
#     it { is_expected.to have_many(:comments).dependent(:destroy).with_foreign_key('user_id') }
#     it { is_expected.to have_many(:likes).dependent(:destroy).with_foreign_key('user_id') }
#   end

#   describe '#most_recent_posts' do
#     it 'returns the most recent posts' do
#       # Assuming you have FactoryBot, you can use create_list to create posts
#       posts = FactoryBot.create_list(:post, 5, author: user)

#       # Reload the user to get the updated posts association
#       user.reload

#       expect(user.most_recent_posts).to eq(posts.last(3).reverse)
#     end
#   end
# end

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it 'should have correct associations' do
      expect(User.reflect_on_association(:comments).macro).to eq(:has_many)
      expect(User.reflect_on_association(:posts).macro).to eq(:has_many)
      expect(User.reflect_on_association(:likes).macro).to eq(:has_many)
    end
  end

  describe 'validations' do
    it 'should validate presence of name' do
      user = User.new(name: nil)
      expect(user).to_not be_valid
      expect(user.errors[:name]).to include("can't be blank")
    end

    it 'should validate numericality of posts_counter' do
      user = User.new(name: 'name', posts_counter: -1)
      expect(user).to_not be_valid
      expect(user.errors[:posts_counter]).to include('must be greater than or equal to 0')
    end
  end

  describe '#three_most_recent_posts' do
    let(:user) { create(:user) }

    it 'returns the three most recent posts' do
      user = User.create(name: 'name')
      first_post = Post.create(title: 'first post', text: 'text', author_id: user.id)
      Post.create(title: 'second post', text: 'text', author_id: user.id)
      Post.create(title: 'third post', text: 'text', author_id: user.id)
      Post.create(title: 'fourth post', text: 'text', author_id: user.id)
      expect(user.most_recent_posts).to_not include(first_post)
    end
  end
end
