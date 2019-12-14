require 'rails_helper'

RSpec.describe 'As a user' do
  it 'I can add a new recipe' do
    user = create(:user)

    visit root_path

    click_on 'Log in'
    expect(current_path).to eq(new_session_path)

    fill_in 'session[email]', with: user.email
    fill_in 'session[password]', with: user.password

    click_on 'Log In'

    expect(current_path).to eq(root_path)

    find("#my-stuff").find("#add-recipe-path").click

    expect(current_path).to eq(new_user_recipe_path(user.id))

    fill_in 'recipe[title]', with: "Spaghetti"
    fill_in 'recipe[description]', with: "This is a recipe for spaghetti"
    select 'American', from: :recipe_type

    click_on 'Create Recipe'

    fill_in 'ingredient[name]', with: "Spaghetti"
    select 'spice', from: :ingredient_type

    select 'volume', from: :measurement_type
    select 'cup', from: :measurement

    fill_in 'ingredient[recipe_ingredients][quantity]', with: 1.5

    click_on 'Add Ingredient'

    click_button 'Next'

    fill_in 'step[step]', with: "Start a large pot of boiling water"

    click_on 'Add step'

    expect(page).to have_content("Start a large pot of boiling water")

    click_button 'Done'

    expect(page).to have_content("Crop Image")
  end

  it 'I cannot add a new recipe without require recipe fields' do
    user = create(:user)

    visit root_path

    click_on 'Log in'

    expect(current_path).to eq(new_session_path)

    fill_in 'session[email]', with: user.email
    fill_in 'session[password]', with: user.password

    click_on 'Log In'

    expect(current_path).to eq(root_path)

    find("#my-stuff").find("#add-recipe-path").click

    expect(current_path).to eq(new_user_recipe_path(user.id))

    fill_in 'recipe[title]', with: "Spaghetti"
    select 'American', from: :recipe_type

    click_on 'Create Recipe'

    expect(page).to have_content("Description can't be blank")
  end

  it 'I cannot add a new recipe without required ingredient fields' do
    user = create(:user)

    visit root_path

    click_on 'Log in'

    expect(current_path).to eq(new_session_path)

    fill_in 'session[email]', with: user.email
    fill_in 'session[password]', with: user.password

    click_on 'Log In'

    expect(current_path).to eq(root_path)

    find("#my-stuff").find("#add-recipe-path").click

    expect(current_path).to eq(new_user_recipe_path(user.id))

    fill_in 'recipe[title]', with: "Spaghetti"
    fill_in 'recipe[description]', with: "This is a recipe for spaghetti"
    select 'American', from: :recipe_type

    click_on 'Create Recipe'

    select 'spice', from: :ingredient_type

    select 'volume', from: :measurement_type
    select 'cup', from: :measurement

    fill_in 'ingredient[recipe_ingredients][quantity]', with: 1.5

    click_on 'Add Ingredient'

    expect(page).to have_content("Name can't be blank")
  end










  it 'I cannot add a new recipe without required recipe ingredients fields' do
    user = create(:user)

    visit root_path

    click_on 'Log in'

    expect(current_path).to eq(new_session_path)

    fill_in 'session[email]', with: user.email
    fill_in 'session[password]', with: user.password

    click_on 'Log In'

    expect(current_path).to eq(root_path)

    find("#my-stuff").find("#add-recipe-path").click

    expect(current_path).to eq(new_user_recipe_path(user.id))

    fill_in 'recipe[title]', with: "Spaghetti"
    fill_in 'recipe[description]', with: "This is a recipe for spaghetti"
    select 'American', from: :recipe_type

    click_on 'Create Recipe'

    fill_in 'ingredient[name]', with: "Spaghetti"
    select 'spice', from: :ingredient_type

    select 'volume', from: :measurement_type
    select 'cup', from: :measurement

    click_on 'Add Ingredient'

    expect(page).to have_content("Quantity can't be blank")
  end
end
