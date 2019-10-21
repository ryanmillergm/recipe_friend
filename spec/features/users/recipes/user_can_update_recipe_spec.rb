require 'rails_helper'

RSpec.describe 'As a user' do
  before :each do
    @user1 = create(:user)
    @ingredients1 = create(:ingredient)
    @recipe1 = create(:recipe, user_id: @user1.id)
    @ri1 = create(:recipe_ingredient, recipe_id: @recipe1.id, ingredient_id: @ingredients1.id)
    @recipe1.image.attach(io: File.open('app/assets/images/Spaghetti-Meat-Sauce.jpg'), filename: 'Spaghetti-Meat-Sauce.jpg', content_type: "image/jpeg")
  end

  it 'I can update a recipe' do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user1)

    visit dashboard_my_recipes_path

    within(first('.my-recipe-results')) do
      click_on "#{@recipe1.title}"
    end

    click_on 'Edit Recipe'

    expect(current_path).to eq(edit_user_recipe_path(@recipe1.id))

    fill_in 'recipe[title]', with: "Spaghetti and Meatballs"
    fill_in 'recipe[description]', with: "This is a recipe for spaghetti with meatballs"
    select 'American', from: :recipe_type

    click_on 'Create Recipe'

    expect(current_path).to eq(edit_ingredient_path(@ingredients1.id))

    fill_in 'ingredient[name]', with: "Spaghetti noodles"
    select 'protein', from: :ingredient_type

    select 'weight', from: :measurement_type
    select 'ounce', from: :measurement

    fill_in 'ingredient[recipe_ingredients][quantity]', with: 12

    click_on 'Update Ingredient'

    expect(current_path).to eq(dashboard_my_recipe(@recipe1.id))
  end
end
