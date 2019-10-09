require 'rails_helper'

RSpec.describe 'As a user' do
  before :each do
    @user1 = create(:user)
    @ingredients1 = create(:ingredient)
    @recipe1 = create(:recipe, user_id: @user1.id)
    @ri1 = create(:recipe_ingredient, recipe_id: @recipe1.id, ingredient_id: @ingredients1.id)
  end
  it 'I can add a recipe I like to my favorites' do
    visit root_path

    click_on 'Log in'

    expect(current_path).to eq(new_session_path)

    fill_in 'session[email]', with: @user1.email
    fill_in 'session[password]', with: @user1.password

    click_on 'Log In'

    expect(current_path).to eq(user_path(@user1.id))
    expect(page).to have_content(@user1.username)

    click_on 'Search Recipes'

    expect(current_path).to eq('/recipes')
    # save_and_open_page
    click_on "#{@recipe1.title}"

    expect(current_path).to eq("/recipes/#{@recipe1.id}")

    expect(page).to have_link('Add to Favorites')

    click_on 'Add to Favorites'

    expect(page).to have_content("#{@recipe1.title} has been added to your favorites!")
  end
end