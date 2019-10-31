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

    expect(current_path).to eq(user_path(user.id))

    click_on 'Dashboard'

    within('#nav-add-recipe') do
      click_link 'Add Recipe'
    end

    expect(current_path).to eq(new_user_recipe_path(user.id))

    fill_in 'recipe[title]', with: "Spaghetti"
    fill_in 'recipe[description]', with: "This is a recipe for spaghetti"
    select 'American', from: :recipe_type

    click_on 'Create Recipe'

    expect(current_path).to eq(new_ingredient_path)

    fill_in 'ingredient[name]', with: "Spaghetti"
    select 'spice', from: :ingredient_type

    select 'volume', from: :measurement_type
    select 'cup', from: :measurement

    fill_in 'ingredient[recipe_ingredients][quantity]', with: 1.5

    click_on 'Add Ingredient'

    expect(current_path).to eq(new_ingredient_path)

    click_button 'Next'

    expect(current_path).to eq(new_step_path)
  end

  it 'I cannot add a new recipe without require recipe fields' do
    user = create(:user)

    visit root_path

    click_on 'Log in'

    expect(current_path).to eq(new_session_path)

    fill_in 'session[email]', with: user.email
    fill_in 'session[password]', with: user.password

    click_on 'Log In'

    expect(current_path).to eq(user_path(user.id))

    click_on 'Dashboard'

    within('#nav-add-recipe') do
      click_link 'Add Recipe'
    end

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

    expect(current_path).to eq(user_path(user.id))

    click_on 'Dashboard'

    within('#nav-add-recipe') do
      click_link 'Add Recipe'
    end

    expect(current_path).to eq(new_user_recipe_path(user.id))

    fill_in 'recipe[title]', with: "Spaghetti"
    fill_in 'recipe[description]', with: "This is a recipe for spaghetti"
    select 'American', from: :recipe_type

    click_on 'Create Recipe'

    expect(current_path).to eq(new_ingredient_path)

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

    expect(current_path).to eq(user_path(user.id))

    click_on 'Dashboard'

    within('#nav-add-recipe') do
      click_link 'Add Recipe'
    end

    expect(current_path).to eq(new_user_recipe_path(user.id))

    fill_in 'recipe[title]', with: "Spaghetti"
    fill_in 'recipe[description]', with: "This is a recipe for spaghetti"
    select 'American', from: :recipe_type

    click_on 'Create Recipe'

    expect(current_path).to eq(new_ingredient_path)

    fill_in 'ingredient[name]', with: "Spaghetti"
    select 'spice', from: :ingredient_type

    select 'volume', from: :measurement_type
    select 'cup', from: :measurement

    click_on 'Add Ingredient'

    expect(page).to have_content("Quantity can't be blank")
  end
end
