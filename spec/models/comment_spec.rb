require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'associations' do
    it 'should be belongs to user' do
      expect(Comment.reflect_on_association(:user).macro).to eq(:belongs_to)
      expect(Comment.reflect_on_association(:post).macro).to eq(:belongs_to)
    end
  end
end
