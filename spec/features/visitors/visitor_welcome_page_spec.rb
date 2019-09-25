require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe 'I can visit the home page' do
    xit 'I see a nav bar with a login' do
      visit root_path
      save_and_open_page

      expect(page).to have_content("Log in")
      expect(page).to have_content("Search Recipes")
      # expect(page).to_not have_content("Dashboard")
      # expect(page).to_not have_content("Favorites")

    end

    xit 'I see a recipe search bar' do
      visit root_path

      within '.recipe-search' do
        expect(page).to have_content("Search Recipes")
      end
    end
  end
end
