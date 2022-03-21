require 'rails_helper'

describe 'navigate' do
  # Before doing all the test I am using Warden to make the app log in
  before do
    @user = FactoryGirl.create(:user)
    login_as(@user, scope: :user)
    visit new_post_path
  end
  describe 'index' do
    before do
      visit posts_path
    end
    it 'can be reached successfully' do
      expect(page.status_code).to eq(200)
    end

    it 'has a title of Posts' do
      expect(page).to have_content(/Posts/)
    end

    it 'has a lists of posts' do
      FactoryGirl.create(:post)
      FactoryGirl.create(:second_post)
      visit posts_path
      expect(page).to have_content(/rationale|content/)
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

  describe 'edit' do
    it 'can be reached by clicking edit on index page' do
      post = FactoryGirl.create(:post)
      visit posts_path

      click_link "edit_#{post.id}"
      expect(page.status_code).to eq(200)
    end
  end
end
