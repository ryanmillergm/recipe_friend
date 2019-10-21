require 'rails_helper'

RSpec.describe 'As a user' do
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
    @recipe1.image.attach(io: File.open('app/assets/images/Spaghetti-Meat-Sauce.jpg'), filename: 'Spaghetti-Meat-Sauce.jpg', content_type: "image/jpeg")
    @recipe2.image.attach(io: File.open('app/assets/images/chicken-noodle-soup.jpg'), filename: 'chicken-noodle-soup.jpg', content_type: "image/jpeg")
    @recipe3.image.attach(io: File.open('app/assets/images/homemade-pasta-lasagna-sheet.jpg'), filename: 'homemade-pasta-lasagna-sheet.jpg', content_type: "image/jpeg")
  end

  it 'I can visit and see my recipes' do
    visit dashboard_path

    click_on 'My Recipes'

    expect(current_path).to eq(dashboard_my_recipes_path)

    within(first('.my-recipe-results')) do
      expect(page).to have_css(".title")
      expect(page).to have_css(".description")
    end
  end
end
