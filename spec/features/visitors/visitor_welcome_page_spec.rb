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
      @recipe1.image.attach(io: File.open('app/assets/images/Spaghetti-Meat-Sauce.jpg'), filename: 'Spaghetti-Meat-Sauce.jpg', content_type: "image/jpeg")
      @recipe2.image.attach(io: File.open('app/assets/images/chicken-noodle-soup.jpg'), filename: 'chicken-noodle-soup.jpg', content_type: "image/jpeg")
      @recipe3.image.attach(io: File.open('app/assets/images/homemade-pasta-lasagna-sheet.jpg'), filename: 'homemade-pasta-lasagna-sheet.jpg', content_type: "image/jpeg")
      @user2 = User.create(first_name: "ryan", last_name: "miller", username: "rm", password: "password", email: "rm@gmail.com", role: 0)
    end

    it 'I see a nav bar with a login' do
      visit root_path

      expect(page).to have_content("Log in")
    end

    it 'I see a recipe search bar' do
      visit root_path

      click_on "Search Recipes"

      expect(current_path).to eq('/recipes')

      within(first('.recipe')) do
        expect(page).to have_css(".recipe-image")
        expect(page).to have_css(".recipe-title")
        expect(page).to have_css(".description")
      end
    end
  end
end
