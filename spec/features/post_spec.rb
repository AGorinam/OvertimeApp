require 'rails_helper'

describe 'navigate' do
  # Before doing all the test I am using Warden to make the app log in
  before do
    user = User.create(
      email: 'test@test.com',
      password: '123123',
      password_confirmation: '123123',
      first_name: 'Jon',
      last_name: 'Snow'
    )
    login_as(user, :scope => :user)
    visit new_post_path
  end
  describe 'index' do
    it 'can be reached successfully' do
      visit posts_path
      expect(page.status_code).to eq(200)
    end

    it 'has a title of Posts' do
      visit posts_path
      expect(page).to have_content(/Posts/)
    end

    it 'has a lists of posts' do
      post1 = Post.create(date: Date.today, rationale: 'Post 1')
      post2 = Post.create(date: Date.today, rationale: 'Post 2')
      visit posts_path
      expect(page).to have_content(/Post 1|Post 2/)
    end
  end

  describe 'creation' do
    it 'has a new page that can be reached' do
      expect(page.status_code).to eq(200)
    end

    it 'can be created from new form page' do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: 'Some rationale'
      click_on 'Save'

      expect(page).to have_content('Some rationale')
    end

    it 'will have a user associated with it' do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: "User Assotiation"
      click_on 'Save'

      expect(User.last.posts.last.rationale).to eq("User Assotiation")
    end
  end
end
