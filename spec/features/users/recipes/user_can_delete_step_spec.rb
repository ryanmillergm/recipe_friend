require 'rails_helper'

RSpec.describe 'As a user' do
  before :each do
    @user1 = create(:user)
    @ingredients1 = create(:ingredient)
    @recipe1 = create(:recipe, user_id: @user1.id)
    @ri1 = create(:recipe_ingredient, recipe_id: @recipe1.id, ingredient_id: @ingredients1.id)
    @recipe1.image.attach(io: File.open('app/assets/images/Spaghetti-Meat-Sauce.jpg'), filename: 'Spaghetti-Meat-Sauce.jpg', content_type: "image/jpeg")
    @step1 = Step.create(step: "Add all ingredients together and mix", recipe_id: @recipe1.id)
  end

  it 'I can delete a recipe' do
    visit root_path

    click_on 'Log in'

    expect(current_path).to eq(new_session_path)

    fill_in 'session[email]', with: @user1.email
    fill_in 'session[password]', with: @user1.password

    click_on 'Log In'

    click_on 'Dashboard'

    click_on 'My Recipes'

    within(first('.recipe')) do
      click_on "#{@recipe1.title}"
    end

    click_button 'Edit Recipe'

    click_button 'Update'
    click_button 'Next'

    within(".step-1") do
      click_button 'Delete'
    end

    expect(page).to have_content("Your step has been removed")
    expect(page).to_not have_content(@step1.step)
  end
end
