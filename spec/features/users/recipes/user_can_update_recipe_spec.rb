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
    visit root_path

    click_on 'Log in'

    expect(current_path).to eq(new_session_path)

    fill_in 'session[email]', with: @user1.email
    fill_in 'session[password]', with: @user1.password

    click_on 'Log In'

    click_on 'Dashboard'

    click_on 'My Recipes'

    within(first('.my-recipe-results')) do
      click_on "#{@recipe1.title}"
    end

    click_on 'Edit Recipe'

    fill_in 'recipe[title]', with: "Spaghetti and Meatballs"
    fill_in 'recipe[description]', with: "This is a recipe for spaghetti with meatballs"
    select 'Italian', from: :recipe_type

    click_on 'Update Recipe'

    expect(current_path).to eq(edit_ingredient_path(@recipe1.id))

    fill_in 'ingredient[name]', with: "Spaghetti noodles"
    select 'protein', from: :ingredient_type

    select 'weight', from: :measurement_type
    select 'ounce', from: :measurement

    fill_in 'ingredient[recipe_ingredient][quantity]', with: 12

    click_on 'Update Ingredient'
  end
end
