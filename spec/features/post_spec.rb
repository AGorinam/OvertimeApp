require 'rails_helper'

describe 'navigate' do
  describe 'index' do
    it 'can be reached successfully' do
      visit posts_path
      expect(page.status_code).to eq(200)
    end

    it 'has a title of Posts' do
      visit posts_path
      expect(page).to have_content(/Posts/)
    end
  end

  describe 'creation' do
    it 'has a new page that can be reached' do
      visit new_post_path
      expect(page.status_code).to eq(200)
    end

    # it 'can be created from new form page' do
    #   visit new_post_path

    #   fill_in 'post_date', with: Date.today
    #   fill_in 'date', with: 'Some rationale'

    #   click_on 'save'

    #   expect(page).to have_content('Some rationale')
    # end
  end
end
