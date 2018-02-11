require 'rails_helper'

RSpec.describe 'shortening url', type: :feature do
  context 'with valid attributes' do
    let(:original_url) { 'http://lucasrenan.com' }

    it 'shortens the url' do
      visit '/'
      fill_in 'Original url', with: original_url
      click_button 'Shorten'

      expect(page).to have_content('Url was successfully shortened.')
      expect(page).to have_content(original_url)
    end
  end

  context 'with invalid attributes' do
    it 'does not shorten url' do
      visit '/'
      fill_in 'Original url', with: ''
      click_button 'Shorten'

      expect(page).to have_content("Original url can't be blank")
      expect(page).to_not have_content('Url was successfully shortened.')
    end
  end
end
