require 'rails_helper'

RSpec.describe 'As a user' do
  describe 'when I visit the dashboard page' do
    before :each do
      @user1 = create(:user)
      @ingredients1 = create(:ingredient)
      @ingredients2 = create(:ingredient)
      @recipe1 = create(:recipe, user_id: @user1.id)
      @recipe2 = create(:recipe, user_id: @user1.id)
      @recipe3 = create(:recipe, user_id: @user1.id)
      @ri1 = create(:recipe_ingredient, recipe_id: @recipe1.id, ingredient_id: @ingredients1.id)
      @ri2 = create(:recipe_ingredient, recipe_id: @recipe2.id, ingredient_id: @ingredients2.id)
      @ri3 = create(:recipe_ingredient, recipe_id: @recipe3.id, ingredient_id: @ingredients2.id)
      @fav1 = create(:favorite, user_id: @user1.id, recipe_id: @recipe1.id)
      @fav2 = create(:favorite, user_id: @user1.id, recipe_id: @recipe2.id)
      @fav3 = create(:favorite, user_id: @user1.id, recipe_id: @recipe3.id)
    end

    it 'I see a section showing a list of 4 of my favorites' do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user1)

      visit dashboard_path

      within('.fav-dashboard') do
        expect(page).to have_link('Favorites')
        expect(page).to have_content(@fav1.title)
        expect(page).to have_content(@fav2.title)
        expect(page).to have_content(@fav3.title)
      end
    end

    it 'I can click on Favorites title and it will take me to favorites' do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user1)

      visit dashboard_path

      expect(page).to have_link('Favorites')

      within('.fav-dashboard') do
        click_link 'Favorites'
      end

      expect(current_path).to eq(favorites_path)
    end

    it 'I can click on a favorite recipe and it will take me to that recipes show page' do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user1)

      visit dashboard_path

      within('.fav-dashboard') do
        click_link "#{@fav1.title}"
      end

      expect(current_path).to eq(recipe_path(@recipe1.id))
    end
  end
end
