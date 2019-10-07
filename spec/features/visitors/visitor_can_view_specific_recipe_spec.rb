require 'rails_helper'

RSpec.describe 'As a visitor' do
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
  it 'I can search for recipes and click on a recipe to view details' do

    visit root_path

    fill_in "q", with: "spaghetti"

    click_on "Search Recipes"

    # save_and_open_page

    expect(current_path).to eq('/recipes')

    within('.recipe-1')

    click_on 'recipe-1'

    expect(current_path).to eq(recipe_path(@recipe1.id))

    within(first('.recipe-results')) do
      expect(page).to have_css(".title")
      expect(page).to have_css(".description")
    end

    within(first('.ingredients')) do
      expect(page).to have_css(".name")
    end
  end
end
