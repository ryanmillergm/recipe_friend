require 'rails_helper'

RSpec.describe 'As a user' do
  it 'I can add a new recipe' do

    visit dashboard_index_path

    click_on 'Add Recipe'

    expect(current_path).to eq(new_recipe_path)

    fill_in 'recipe[title]', with: "Spaghetti"
    fill_in 'recipe[description]', with: "This is a recipe for spaghetti"
    select 'American', from: :recipe_type_list

    click_on 'Add Ingredients'

    expect(current_path).to eq(new_ingredient_path)

    fill_in 'ingredient[name]', with: "Spaghetti"
    select 'spice', from: :ingredient_type_list

    click_on 'Add Ingredient'

    expect(current_path).to eq(edit_recipe_ingredients_path)

    select 'volume/liquid', from: :measurement_type_list
    select 'cup', from: :measurement_list
    fill_in 'recipe_ingredient[description]', with: "This is a recipe for spaghetti"
  end
end
