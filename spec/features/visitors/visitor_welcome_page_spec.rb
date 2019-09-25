require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe 'I can visit the home page' do
    it 'I see a nav bar with a login' do
      visit root_path

      within '.nav' do
        expect(page).to have_content("Login")
        expect(page).to_not have_content("Dashboard")
        expect(page).to_not have_content("Favorites")
      end
    end

    it 'I see a recipe search bar' do
      visit root_path

      within '.recipe-search' do
        expect(page).to have_content("Search Recipes")
      end
    end
  end
end
