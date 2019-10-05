require 'rails_helper'

describe 'Navigation Requests Spec' do

  describe 'Navigation should be available' do
    it 'should show the navigation on the home page' do
      visit root_path

      expect(page).to have_link('Home')
      expect(page).to_not have_link('Dashboard')
      expect(page).to_not have_link('Favorites')
      expect(page).to_not have_link('Log out')
      expect(page).to have_link('Log in')
    end
  end
end
