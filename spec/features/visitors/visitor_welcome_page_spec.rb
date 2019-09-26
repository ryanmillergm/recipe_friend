require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe 'I can visit the home page' do
    before :each do
    @user1 = create(:user)
    @ingredients1 = create(:ingredient)
    @ingredients2 = create(:ingredient)
    @ingredients3 = create(:ingredient)
    @recipe1 = create(:recipe, user_id: @user1.id)
    @recipe2 = create(:recipe, user_id: @user1.id)
    @recipe3 = create(:recipe, user_id: @user1.id)
    @ri1 = create(:recipe_ingredient, recipe_id: @recipe1.id, ingredient_id: @ingredients1.id)
    @ri2 = create(:recipe_ingredient, recipe_id: @recipe1.id, ingredient_id: @ingredients2.id)
    @ri3 = create(:recipe_ingredient, recipe_id: @recipe1.id, ingredient_id: @ingredients3.id)
    @user2 = User.create(first_name: "ryan", last_name: "miller", username: "rm", password: "password", email: "rm@gmail.com", role: 0)
  end
    xit 'I see a nav bar with a login' do
      visit root_path

      expect(page).to have_content("Log in")
      expect(page).to have_content("Search Recipes")
      # expect(page).to_not have_content("Dashboard")
      # expect(page).to_not have_content("Favorites")

    end

    it 'I see a recipe search bar' do
      visit root_path

      fill_in "q", with: "spaghetti"

      click_on "Search Recipes"

      expect(current_path).to eq('/recipes')
      # expect(background).to have_key(:owner)
    end
  end
end
