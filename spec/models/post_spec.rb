require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'Creation' do
    before do
      @user = User.create(
        email: 'test@test.com',
        password: '123123',
        password_confirmation: '123123',
        first_name: 'Jon',
        last_name: 'Snow'
      )
      @post = Post.create(date: Date.today, rationale: "Anything", user_id: @user.id)
    end
    it 'can be created' do
      post = Post.create(date: Date.today, rationale: "Anything", user_id: @user.id)
      expect(post).to be_valid
    end
  end
end
