require 'rails_helper'

RSpec.describe Like, type: :model do
  describe 'associations' do
    it { should belong_to(:user).class_name('User') }
    it { should belong_to(:post) }
  end

  describe 'callbacks' do
    describe 'after_save' do
      let(:user) { User.create(name: 'Juwairiyya Sadiq') }
      let(:post) { Post.create(title: 'Test Post') }
    end
  end
end
